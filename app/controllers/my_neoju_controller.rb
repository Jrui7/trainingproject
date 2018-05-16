class MyNeojuController < ApplicationController

  before_action :set_sample, only: [:my_picks]

  def my_seeds
    @seeds = Seed.where(user_id: current_user)
  end

  def my_picks
    @picks = current_user.picks.includes(:seed).newest
    authorize @picks
  end


end
