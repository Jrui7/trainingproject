class PaymentsController < ApplicationController

    before_action :set_pick

    def new
      @user = current_user
      unless current_user.customer_id.blank?
        @customer_infos = Stripe::Customer.retrieve(@user.customer_id)
      end
    end

    def create

      if current_user.customer_id.blank?
        customer = Stripe::Customer.create(
          source: params[:stripeToken],
          email:  params[:stripeEmail]
        )

        customer_id = customer.id
        current_user.customer_id = customer_id
        current_user.address = params["stripeBillingAddressLine1"]
        current_user.zip_code = params["stripeBillingAddressZip"]
        current_user.city = params["stripeBillingAddressCity"]
        current_user.last_name = params["stripeBillingName"]
        current_user.save

      else
        if params[:stripeToken]
          cu = Stripe::Customer.retrieve("#{current_user.customer_id}")
          cu.source = params[:stripeToken] # obtained with Stripe.js
          cu.save
          customer_id = current_user.customer_id
          current_user.customer_id = customer_id
          current_user.save
        else
          customer_id = current_user.customer_id
        end
      end


      charge = Stripe::Charge.create(
        customer:     customer_id,   # You should store this customer id and re-use it.
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
