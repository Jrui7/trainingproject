class MySeedoakController < ApplicationController

  def feed
    user_preferences = UserPreference.where(user_id: current_user)

    categories = []

    user_preferences.each do |preference|
      categories << preference.category_id
    end

    @seeds = Seed.where(category_id: categories)
  end

  def my_seeds
    @seeds = Seed.where(user_id: current_user)
  end

  def my_picks
    @user = current_user
    @picks = current_user.picks.includes(:seed).newest
  end

end
