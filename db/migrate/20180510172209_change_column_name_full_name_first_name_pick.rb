class ChangeColumnNameFullNameFirstNamePick < ActiveRecord::Migration[5.0]
  def change
    rename_column :picks, :full_name, :first_name
    add_column :picks, :last_name, :string
  end
end
