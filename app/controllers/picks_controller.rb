class PicksController < ApplicationController

  def index
    @picks = current_user.picks
  end


  def create
    @pick = Pick.new(pick_params)
    @user = current_user
    @pick.user = current_user
    @seed = Seed.find(params[:seed_id])
    @pick.seed = Seed.find(params[:seed_id])
    if @pick.save
      @seed.increment_popularity
      respond_to do |format|
        format.html { redirect_to seed_path(@seed) }
        format.js
      end

    else
      @seed = @pick.seed
      render 'seeds/show'
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
