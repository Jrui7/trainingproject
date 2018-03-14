class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_sample, only: [:faq, :contact, :mentions_legales, :cgv, :cgu]
  before_action :set_page_action, only: [:faq, :contact, :mentions_legales, :cgv, :cgu]


  def home
  end

  def faq
  end

  def contact
  end

  def mentions_legales
  end

  def cgv
  end

  def cgu
  end

  private

  def set_page_action
    @page = params["action"]
  end

end
