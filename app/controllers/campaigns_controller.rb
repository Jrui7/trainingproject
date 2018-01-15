class CampaignsController < ApplicationController

  def index
    @pending = Seed.joins(:campaign).where(campaigns: {status: "pending"}).count
    @signaled = Seed.joins(:signal_seed).distinct.count
  end

  def update

  end

  def pending
    @seeds = Seed.joins(:campaign).where(campaigns: {status: "pending"})
  end

  def success
    @seeds = Seed.joins(:campaign).where(campaigns: {status: "success"})
  end

  def fail
    @seeds = Seed.joins(:campaign).where(campaigns: {status: "fail"})
  end

  def signaled
    @seeds = Seed.where(admin_validation: false).joins(:signal_seed).distinct
    @signaled = Seed.joins(:signal_seed).distinct.count
  end

end
