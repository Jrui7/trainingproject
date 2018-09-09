class PaymentsController < ApplicationController

    before_action :set_pick


    def new
      @user = current_user
      @user.addresses.any? ? @customer_address = @user.addresses.first : @customer_address = Address.new
      @seed = @pick.seed
      unless @user.customer_id.blank?
        @customer_infos = Stripe::Customer.retrieve(@user.customer_id).sources.data[0]
      end
    end

    def create
      @user = current_user
      pick_address = @user.addresses.last

      if @user.customer_id.blank?
        card = params[:stripeToken]
        customer = Stripe::Customer.create(
          source: card,
          email:  @user.email
        )

        customer_id = customer.id
        @user.customer_id = customer_id
        @user.save
        card = Stripe::Token.retrieve(card)["card"]

      elsif params[:stripeToken]
        card = params[:stripeToken]
        cu = Stripe::Customer.retrieve("#{@user.customer_id}")
        cu.sources.create(source: card)
        card = Stripe::Token.retrieve(card)["card"]
        cu.default_source = card
        cu.save

      else
        customer_id = @user.customer_id
        card = Stripe::Customer.retrieve(customer_id)["sources"]["data"].first
      end
      @pick.update(payment: card, state: 'validated', first_name: pick_address.first_name, last_name: pick_address.last_name, street: pick_address.street, address_complement: pick_address.address_complement, zip_code: pick_address.zip_code, city: pick_address.city, phone_number: pick_address.phone_number)
      # charge = Stripe::Charge.create(
      #         customer:     customer_id,   # You should store this customer id and re-use it.
      #         amount:       @pick.amount_cents,
      #         description:  "Participation au deal pour #{@pick.seed.title} enregistrée",
      #         currency:     @pick.amount.currency
      #       )

      redirect_to pick_path(@pick)

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
