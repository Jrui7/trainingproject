class ChangeSeedPriceToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :seeds, :price_cents, :float
  end
end
