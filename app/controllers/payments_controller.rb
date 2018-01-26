class PaymentsController < ApplicationController

    before_action :set_pick

    def new
      @user = current_user
      unless current_user.customer_id.blank?
        @customer_infos = Stripe::Customer.retrieve(@user.customer_id)
        @customer_address = current_user.addresses.first
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
        current_user.save
        Address.create(user_id: current_user.id, full_name: params["stripeBillingName"], street: params["stripeBillingAddressLine1"], zip_code: params["stripeBillingAddressZip"], city: params["stripeBillingAddressCity"])

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

      pick_address = current_user.addresses.last

      @pick.update(payment: charge.to_json, state: 'paid', full_name: pick_address.full_name, street: pick_address.street, address_complement: pick_address.address_complement, zip_code: pick_address.zip_code, city: pick_address.city, phone_number: pick_address.phone_number)
      redirect_to my_picks_path

      rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_pick_payment_path(@pick)


    end





  private

    def set_pick
      @pick = Pick.where(state: 'pending').find(params[:pick_id])
      authorize @pick
    end



end
