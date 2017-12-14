class AddSalePointInfosToSeed < ActiveRecord::Migration[5.0]
  def change
    add_column :seeds, :sale_point_url, :string
    add_column :seeds, :sale_point_address, :string
    add_column :seeds, :sale_point_contact, :string
  end
end
