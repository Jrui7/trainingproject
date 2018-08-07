class ChangeCampaignPriceToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :campaigns, :price, :float
  end
end
