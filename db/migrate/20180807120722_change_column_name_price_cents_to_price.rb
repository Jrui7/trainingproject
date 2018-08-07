class ChangeColumnNamePriceCentsToPrice < ActiveRecord::Migration[5.0]
  def change
    rename_column :seeds, :price_cents, :price
  end
end
