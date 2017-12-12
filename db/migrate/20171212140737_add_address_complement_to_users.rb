class AddAddressComplementToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :address_complement, :string
  end
end
