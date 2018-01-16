class RemoveAdminValidationFromSeeds < ActiveRecord::Migration[5.0]
  def change
    remove_column :seeds, :admin_validation
  end
end
