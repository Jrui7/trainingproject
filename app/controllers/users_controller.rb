class UsersController < ApplicationController

  before_action :set_sample, only: [:show, :update]


  def show
    @user = User.friendly.find(params[:id])
    @addresses = @user.addresses.first
    authorize @user
  end

  def update
    @user = User.friendly.find(params[:id])
    @user.slug = @user.pseudo
    authorize @user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :show
    end
  end

  def update_address
    @user = User.friendly.find(params[:id])
    @address = @user.addresses.first
    authorize @user
    if @address.update(address_params)
      redirect_to @user
    else
      render :show
    end
  end


  def update_card
    @user = current_user
    authorize @user
    url = Rails.application.routes.recognize_path(request.referrer)
    pick = Pick.find(url[:pick_id])
    cu = Stripe::Customer.retrieve("#{@user.customer_id}")
    cu.source = params[:stripeToken] # obtained with Stripe.js
    cu.save
    redirect_to new_pick_payment_path(pick)
  end

  private

  def user_params
    params.require(:user).permit(:photo, :insta, :youtube, :facebook, :snap, :mini_bio, :pseudo, :email, :sex, :date_of_birth)
  end

  def address_params
    params.require(:address).permit(:full_name, :street, :zip_code, :city, :address_complement, :phone_number)
  end



end
