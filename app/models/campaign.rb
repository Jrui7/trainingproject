class Campaign < ApplicationRecord
  belongs_to :seed

  def finalize_campaign
    self.seed.picks.each do |pick|
      FinalizeCampaignJob.perform_later(pick.id)
    end
  end



end
