class RemoveDefaultValuePriceSeeds < ActiveRecord::Migration[5.0]
  def change
    change_column_default :seeds, :price_cents, nil
  end
end
