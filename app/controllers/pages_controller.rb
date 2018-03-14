class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_sample


  def home
  end

  def infos
  end

  def faq
    @page = params["action"]
  end

  def contact
  end

  def mentions_legales
    @page = params["action"]
  end

  def cgv
  end

  def cgu
  end

end
