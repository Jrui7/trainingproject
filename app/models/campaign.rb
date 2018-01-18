class Campaign < ApplicationRecord
  belongs_to :seed

  def finalize_campaign
    self.seed.picks.each do |pick|
      if pick.state == "paid"
        if self.status == "success"
          if pick.price >= self.price
            customer_id = pick.user.customer_id
            pick.amount = self.price
            charge = Stripe::Charge.create(
              customer:     customer_id,   # You should store this customer id and re-use it.
              amount:       pick.amount_cents,
              description:  "Deal confirmé pour #{pick.seed.title}",
              currency:     pick.amount.currency
            )
            pick.update(deal_price: charge.to_json)
            final_payment = JSON.parse(pick.deal_price)
            if final_payment["paid"] == true
              payment_hash = JSON.parse(pick.payment)
               Stripe::Refund.create(
                 charge: payment_hash["id"]
               )
              pick.update(state: "finalized")
            else
              pick.update(state: "error")
            end
          else
            payment_hash = JSON.parse(pick.payment)
             Stripe::Refund.create(
               charge: payment_hash["id"]
             )
            pick.update(state: "pick_failed")
          end
        else
          payment_hash = JSON.parse(pick.payment)
           Stripe::Refund.create(
             charge: payment_hash["id"]
           )
          pick.update(state: "campaign_failed")
        end
      else
        pick.update(state: "campaign_closed")
      end
    end
  end


end
