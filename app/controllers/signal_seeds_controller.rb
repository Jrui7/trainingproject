class SignalSeedsController < ApplicationController

  def create
    seed = Seed.find(params[:seed_id])
    seed.signal_seed.create! user: current_user
    redirect_to seed_path(seed)
  end

  def destroy
    seed = Seed.find(params[:id])
    unsignal = SignalSeed.find(params[:id])
    unsignal.destroy
    redirect_to seed_path(seed)
  end

end
