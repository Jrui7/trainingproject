class CampaignsController < ApplicationController

  def index
    @pending = Seed.joins(:campaign).where(campaigns: {status: "pending"}).count
    @signaled = Seed.where(admin_review: "not-reviewed").joins(:signal_seed).count
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
    @seeds = Seed.where(admin_review: "not-reviewed").joins(:signal_seed)
    @signaled = Seed.where(admin_review: "not-reviewed").joins(:signal_seed).count
  end

end
