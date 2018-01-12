class AddAddressTitleToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :address_title, :string
  end
end
