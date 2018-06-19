class FinalizeCampaignJob < ApplicationJob
  queue_as :default

  def perform(campaign_id)
    campaign = Campaign.find(campaign_id)
      campaign.seed.picks.includes(:user).each do |pick|

      if pick.state == "finalized" || pick.state == "refund_failed"
        previous_payment = JSON.parse(pick.deal_price)
        begin
        Stripe::Refund.create(
          charge: previous_payment["id"]
          )
        pick.update(state: "validated")
        rescue
          pick.update(state: "refund_failed")
        end
      end

      if campaign.status == "success"
        unless pick.state == "pending" && pick.state == "campaign_closed" && pick.state == "cancelled"
          customer_id = pick.user.customer_id
          user_id = pick.user_id
          if pick.price >= campaign.price
            pick.amount = campaign.price
            begin
            charge = Stripe::Charge.create(
              customer:     customer_id,   # You should store this customer id and re-use it.
              amount:       pick.amount_cents,
              description:  "#{pick.seed.title} via Pickalgo",
              currency:     pick.amount.currency
            )
            pick.update(deal_price: charge.to_json)
            pick.update(state: "finalized")
            CampaignMailer.pick_success(user_id, campaign.id, pick.id).deliver_later
            rescue
              pick.update(state: "error")
              CampaignMailer.payment_error(user_id, campaign.id, pick.id).deliver_later
            end
          else
            pick.update(state: "pick_failed")
          end
        end
      else
        pick.update(state: "campaign_failed")
      end

    end
  end
end
