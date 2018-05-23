class UsersController < ApplicationController

  before_action :set_sample, only: [:show, :update]


  def show
    @user = User.friendly.find(params[:id])
    unless @user.customer_id.blank?
      @addresses = @user.addresses.first
      @customer_infos = Stripe::Customer.retrieve(@user.customer_id).sources.data[0]
    end
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

  def update_civil
    @user = User.friendly.find(params[:id])
    authorize @user
    if @user.update(civil_params)
      respond_to do |format|
        format.html {redirect_to user_path(@user)}
        format.js
      end
    end
  end

  def update_address
    @user = User.friendly.find(params[:id])
    @addresses = @user.addresses.first
    authorize @user
    if @addresses.update(address_params)
      respond_to do |format|
        format.html {redirect_to user_path(@user)}
        format.js
      end
    end
  end

  def update_paiement
    @user = User.friendly.find(params[:id])
    authorize @user
    cu = Stripe::Customer.retrieve("#{@user.customer_id}")
    cu.source = params[:stripeToken] # obtained with Stripe.js
    cu.save
    @customer_infos = cu.sources.data[0]
    respond_to do |format|
      format.html {redirect_to user_path(@user)}
      format.js
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
    params.require(:user).permit(:photo, :insta, :youtube, :facebook, :twitter, :mini_bio, :pseudo)
  end

  def address_params
    params.require(:address).permit(:first_name, :last_name, :street, :zip_code, :city, :address_complement, :phone_number)
  end

  def civil_params
    params.require(:user).permit(:sex, :date_of_birth, :email)
  end



end
