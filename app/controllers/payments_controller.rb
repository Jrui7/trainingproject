class PaymentsController < ApplicationController

    before_action :set_pick

    def new
    end

    def create
      customer = Stripe::Customer.create(
        source: params[:stripeToken],
        email:  params[:stripeEmail]
      )

      charge = Stripe::Charge.create(
        customer:     customer.id,   # You should store this customer id and re-use it.
        amount:       @pick.amount_cents,
        description:  "Participation au deal pour #{@pick.seed.title} enregistrée",
        currency:     @pick.amount.currency
      )

      @pick.update(payment: charge.to_json, state: 'paid')
      redirect_to pick_path(@pick)

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_pick_payment_path(@pick)
    end



  private

    def set_pick
      @pick = Pick.where(state: 'pending').find(params[:pick_id])
    end
end
