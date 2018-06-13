class Campaign < ApplicationRecord
  belongs_to :seed

  def finalize_campaign
    self.seed.picks.includes(:user).each do |pick|

      unless pick.deal_price.blank?
        previous_payment = JSON.parse(pick.deal_price)
        if previous_payment["paid"] == true
          begin
          Stripe::Refund.create(
            charge: previous_payment["id"]
            )
          pick.update(state: "validated")
          rescue
            pick.update(state: "refund_failed")
          end
        end
      end

      if pick.state != "pending"
        customer_id = pick.user.customer_id

        if self.status == "success"
          if pick.price >= self.price
            pick.amount = self.price
            begin
            charge = Stripe::Charge.create(
              customer:     customer_id,   # You should store this customer id and re-use it.
              amount:       pick.amount_cents,
              description:  "Deal confirmé pour #{pick.seed.title}",
              currency:     pick.amount.currency
            )
            pick.update(deal_price: charge.to_json)
            pick.update(state: "finalized")

            rescue
              pick.update(state: "error")
            end
          else
            pick.update(state: "pick_failed")
          end
        else
          pick.update(state: "campaign_failed")
        end

      else
        pick.update(state: "campaign_closed")
      end

    end

  end


end
