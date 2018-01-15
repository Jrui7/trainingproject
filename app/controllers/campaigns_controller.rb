class CampaignsController < ApplicationController

  def index
    @seeds = Seed.all.includes(:category)
  end

  def signaled
    @seeds = Seed.joins(:signal_seed).distinct
  end

  def expired
    @seeds = Seed.expired.includes(:category)
  end

  def ongoing
    @seeds = Seed.ongoing.includes(:category)
  end
end
