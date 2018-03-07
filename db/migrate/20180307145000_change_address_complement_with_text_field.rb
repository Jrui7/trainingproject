class ChangeAddressComplementWithTextField < ActiveRecord::Migration[5.0]
  def change
    change_column :addresses, :address_complement, :text
  end
end
