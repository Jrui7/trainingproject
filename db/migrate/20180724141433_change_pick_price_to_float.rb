class ChangePickPriceToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :picks, :price, :float
  end
end
