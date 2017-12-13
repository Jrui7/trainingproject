class AddSalePointToSeed < ActiveRecord::Migration[5.0]
  def change
    add_column :seeds, :sale_point, :string
  end
end
