class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :show
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:photo, :mini_bio, :first_name, :last_name, :pseudo, :email, :sex, :date_of_birth, :address)
  end
end
