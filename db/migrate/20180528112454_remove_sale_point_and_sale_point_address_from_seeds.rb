class RemoveSalePointAndSalePointAddressFromSeeds < ActiveRecord::Migration[5.0]
  def change
    remove_column :seeds, :sale_point
    remove_column :seeds, :sale_point_address
  end
end
