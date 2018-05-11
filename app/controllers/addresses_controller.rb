class AddressesController < ApplicationController

  def create
    url = Rails.application.routes.recognize_path(request.referrer)
    pick = Pick.find(url[:pick_id])
    @address = Address.new(address_params_form_payment)
    @address.user_id = current_user.id
    authorize @address
    if @address.save
      respond_to do |format|
        format.html { redirect_to new_pick_payment_path(pick)}
        format.js
      end
    else
      redirect_to new_pick_payment_path(pick)
    end

  end


  def update
    url = Rails.application.routes.recognize_path(request.referrer)
    pick = Pick.find(url[:pick_id])
    @address = Address.find(params[:id])
    authorize @address

    if @address.update(address_params_form_payment)
      respond_to do |format|
        format.html { redirect_to new_pick_payment_path(pick)}
        format.js
      end
    end
  end


  private

  def address_params_form_payment
    params.require(:address).permit(:first_name, :last_name, :street, :address_complement, :zip_code, :city, :phone_number)
  end
end
