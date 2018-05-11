class ChangeColumnNameFullNameFirstName < ActiveRecord::Migration[5.0]
  def change
    rename_column :addresses, :full_name, :first_name
  end
end
