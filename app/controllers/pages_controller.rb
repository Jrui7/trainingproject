class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @seeds = Seed.last(3)
  end

  def faq
  end

  def team
  end

end
