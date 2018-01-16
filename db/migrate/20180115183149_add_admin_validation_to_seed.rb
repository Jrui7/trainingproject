class AddAdminValidationToSeed < ActiveRecord::Migration[5.0]
  def change
    add_column :seeds, :admin_validation, :boolean, default: false
  end
end
