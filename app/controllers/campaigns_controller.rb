class CampaignsController < ApplicationController

  def index
    @seeds = Seed.all.includes(:category)
  end

  def signaled
    @seeds = Seed.all.joins(:signal_seed)
  end
end
