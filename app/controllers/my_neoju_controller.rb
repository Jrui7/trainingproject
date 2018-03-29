class MyNeojuController < ApplicationController



  def my_seeds
    @seeds = Seed.where(user_id: current_user)
  end

  def my_picks
    @picks = current_user.picks.includes(:seed).newest
    @sample = Seed.ongoing.where.not(admin_review:"Invalide")
    authorize @picks
  end


end
