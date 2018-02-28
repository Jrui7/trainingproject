class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_sample, only: [:faq, :team]


  def home
  end

  def faq
  end

  def team
  end

end
