class Campaign < ApplicationRecord
  belongs_to :seed


  def finalize_campaign
    self.seed.picks.select{|pick| pick.state == "validated"}.includes(:user).each do |pick|
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
      else

      end
    end

  end


end
