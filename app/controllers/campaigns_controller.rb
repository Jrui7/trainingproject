class CampaignsController < ApplicationController

  def index
    @pending = Seed.seed_selection.joins(:campaign).where(campaigns: {status: "pending"}).count
    @signaled = Seed.where(admin_review: "not-reviewed").joins(:signal_seed).distinct.count
  end

  def update

  end

  def pending
    @seeds = Seed.seed_selection.joins(:campaign).where(campaigns: {status: "pending"})
  end

  def success
    @seeds = Seed.joins(:campaign).where(campaigns: {status: "success"})
  end

  def fail
    @seeds = Seed.joins(:campaign).where(campaigns: {status: "fail"})
  end

  def signaled
    @seeds = Seed.where(admin_review: "not-reviewed").joins(:signal_seed).distinct
    @signaled = Seed.where(admin_review: "not-reviewed").joins(:signal_seed).distinct.count
  end

  def destroy
  end

end
