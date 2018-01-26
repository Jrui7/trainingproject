class MySeedlapController < ApplicationController


  def my_seeds
    @seeds = Seed.where(user_id: current_user)
  end

  def my_picks
    @picks = current_user.picks.includes(:seed).newest
    authorize @picks
  end

end
