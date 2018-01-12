class UsersController < ApplicationController

  def show
    @user = current_user
    @addresses = @user.addresses
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
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
