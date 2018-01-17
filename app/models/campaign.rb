class Campaign < ApplicationRecord
  belongs_to :seed

  def finalize_campaign

    self.seed.picks.each do |pick|
      if self.status == "success" && pick.price >= self.price
       customer_id = pick.user.customer_id
       pick.amount = self.price
       charge = Stripe::Charge.create(
         customer:     customer_id,   # You should store this customer id and re-use it.
         amount:       pick.amount_cents,
         description:  "Deal confirmé pour #{pick.seed.title}",
         currency:     pick.amount.currency
       )
       pick.update(deal_price: charge.to_json)
      end

      if pick.state == "paid"
          payment_hash = JSON.parse(pick.payment)
           Stripe::Refund.create(
             charge: payment_hash["id"]
           )

      end
    end
  end
end
