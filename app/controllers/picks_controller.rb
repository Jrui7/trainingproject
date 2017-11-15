class PicksController < ApplicationController

  def index
    @picks = current_user.picks
  end

  def new
    @pick = Pick.new
    @seed = Seed.find(params[:seed_id])
    @user = current_user
    @pick.user = current_user
    @pick.seed = Seed.find(params[:seed_id])

  end

  def create
    @pick = Pick.new(pick_params)
    @pick.save
      @seed.increment_popularity
      respond_to do |format|
        format.html { redirect_to seed_path(@seed) }
        format.js
      end



  end

  def destroy
    @pick = Pick.find(params[:id])
  end

  private

  def pick_params
    params.require(:pick).permit(:price)
  end


end
