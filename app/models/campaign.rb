class Campaign < ApplicationRecord
  belongs_to :seed

  scope :success, -> { where(status: "success") }
  scope :failed, -> { where(status: "fail") }


  def finalize_campaign
    self.seed.picks.each do |pick|
      FinalizeCampaignJob.perform_later(pick.id)
    end
  end



end
