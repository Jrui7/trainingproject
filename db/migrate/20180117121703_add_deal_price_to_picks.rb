class AddDealPriceToPicks < ActiveRecord::Migration[5.0]
  def change
    add_column :picks, :deal_price, :jsonb
  end
end
