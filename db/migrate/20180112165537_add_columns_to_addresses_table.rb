class AddColumnsToAddressesTable < ActiveRecord::Migration[5.0]
  def change
    add_reference :addresses, :user, foreign_key: true
    add_column :addresses, :full_name, :string
    add_column :addresses, :street, :string
    add_column :addresses, :zip_code, :string
    add_column :addresses, :city, :string
    add_column :addresses, :phone_number, :string
    add_column :addresses, :address_complement, :string
  end
end
