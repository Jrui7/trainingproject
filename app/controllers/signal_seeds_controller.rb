class SignalSeedsController < ApplicationController


  def create
    @seed = Seed.friendly.find(params[:seed_id])
    @seed.signal_seed.create! user: current_user
    authorize @seed
    respond_to do |format|
      format.html {redirect_to seed_path(@seed)}
      format.js
    end
  end

  def destroy
    @unsignal = SignalSeed.find(params[:id])
    @seed = @unsignal.seed
    authorize @unsignal
    @unsignal.destroy
    respond_to do |format|
      format.html {redirect_to seed_path(@seed)}
      format.js
    end
  end

end
