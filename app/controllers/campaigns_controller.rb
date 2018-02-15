class CampaignsController < ApplicationController

  before_action :set_and_authorize_campaign, only: [:pending, :success, :fail, :signaled, :message]

  def update
    @campaign = Campaign.find(params[:id])
    authorize @campaign
    @campaign.update(pending_campaign_params)
    @campaign.finalize_campaign
    redirect_to pending_path
  end

  def pending
    @seeds = Seed.where.not(admin_review:"Invalide").includes(:user, :category).includes(:campaign).joins(:campaign).where(campaigns: {status: "pending"})
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

  def message
    @picks =  Pick.joins(:exchanges).where(exchanges: { admin_review: false }).distinct
  end


  private

  def pending_campaign_params
    params.require(:campaign).permit(:status, :price)
  end

  def set_and_authorize_campaign
    @campaign = Campaign.first
    authorize @campaign
  end

end
