class RemoveAddressDetailsFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :address, :string
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :zip_code, :string
    remove_column :users, :address_complement, :string
    remove_column :users, :phone_number, :string
  end
end
