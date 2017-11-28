class PicksController < ApplicationController

  def index
    @user = current_user
    @picks = current_user.picks
  end


  def create
    @user = current_user
    @seed = Seed.find(params[:seed_id])
    @pick = @seed.picks.new(pick_params)
    @pick.user_id = @user.id
    if @pick.save
      @seed.increment_popularity
      respond_to do |format|
        format.html { redirect_to seed_path(@seed) }
        format.js
      end
    end
  end

  def destroy
    @pick = Pick.find(params[:id])
    @pick.destroy
    redirect_to my_picks_path

  end

  private

  def pick_params
    params.require(:pick).permit(:price)
  end


end
