class AddFullNameStreetZipCodeCityAddressComplementToPicks < ActiveRecord::Migration[5.0]
  def change
    add_column :picks, :full_name, :string
    add_column :picks, :street, :string
    add_column :picks, :zip_code, :string
    add_column :picks, :city, :string
    add_column :picks, :phone_number, :string
    add_column :picks, :address_complement, :string
  end
end
