class SignalSeedsController < ApplicationController


  def create
    @seed = Seed.find(params[:seed_id])
    @seed.signal_seed.create! user: current_user
    respond_to do |format|
      format.html {redirect_to seed_path(@seed)}
      format.js
    end
  end

  def destroy
    unsignal = SignalSeed.find(params[:id])
    @seed = unsignal.seed
    unsignal.destroy
    respond_to do |format|
      format.html {redirect_to seed_path(@seed)}
      format.js
    end
  end

end
