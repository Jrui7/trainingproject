class AddressesController < ApplicationController


  def update
    url = Rails.application.routes.recognize_path(request.referrer)
    pick = Pick.find(url[:pick_id])
    @address = Address.find(params[:id])
    authorize @address

    if @address.update(address_params_form_payment)
      redirect_to new_pick_payment_path(pick)
    else
      redirect_to new_pick_payment_path(pick)
    end
  end


  private

  def address_params_form_payment
    params.require(:address).permit(:full_name, :street, :address_complement, :zip_code, :city, :phone_number)
  end
end
