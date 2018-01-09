class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def update
    url = Rails.application.routes.recognize_path(request.referrer)
    last_controller = url[:controller]
    pick_id = url[:pick_id]


    if last_controller == "payments"
      if current_user.update(user_params_form_payment)
        redirect_to new_pick_payment_path(pick_id)
      else
        redirect_to new_pick_payment_path(pick_id)
      end
    else
      if current_user.update(user_params)
        redirect_to user_path(current_user)
      else
        render :show
      end
    end

  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:photo, :insta, :youtube, :facebook, :snap, :mini_bio, :first_name, :last_name, :pseudo, :email, :sex, :date_of_birth, :address, :address_complement, :zip_code, :city, :phone_number)
  end

  def user_params_form_payment
    params.require(:user).permit(:first_name, :last_name, :email, :address, :address_complement, :zip_code, :city, :phone_number)
  end
end
