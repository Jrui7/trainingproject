class UsersController < ApplicationController

  def show
    @user = current_user
    @addresses = @user.addresses
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :show
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:photo, :insta, :youtube, :facebook, :snap, :mini_bio, :pseudo, :email, :sex, :date_of_birth)
  end


end
