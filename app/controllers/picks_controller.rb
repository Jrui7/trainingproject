class PicksController < ApplicationController

  def index
    @picks = current_user.picks
  end


  def create
    @seed = Seed.find(params[:seed_id])
    @pick = @seed.picks.new(pick_params)
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
  end

  private

  def pick_params
    params.require(:pick).permit(:price)
  end


end
