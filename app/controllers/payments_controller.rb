class PaymentsController < ApplicationController

    before_action :set_pick

    def new
      @user = current_user
      @user.addresses.any? ? @customer_address = @user.addresses.first : @customer_address = Address.new
      unless @user.customer_id.blank?
        @customer_infos = Stripe::Customer.retrieve(@user.customer_id).sources.data[0]
      end
    end

    def create
      @user = current_user
      if @user.customer_id.blank?
        customer = Stripe::Customer.create(
          source: params[:stripeToken],
          email:  @user.email
        )
        customer_id = customer.id
        @user.customer_id = customer_id
        @user.save
      else
        customer_id = @user.customer_id
      end

      pick_address = @user.addresses.last
      charge = Stripe::Charge.create(
        customer:     customer_id,   # You should store this customer id and re-use it.
        amount:       @pick.amount_cents,
        description:  "Participation au deal pour #{@pick.seed.title} enregistrée",
        currency:     @pick.amount.currency
      )

      @pick.update(payment: charge.to_json, state: 'paid', first_name: pick_address.first_name, last_name: pick_address.first_name, street: pick_address.street, address_complement: pick_address.address_complement, zip_code: pick_address.zip_code, city: pick_address.city, phone_number: pick_address.phone_number)
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
