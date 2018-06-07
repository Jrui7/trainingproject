class AddDefaultStateToPickState < ActiveRecord::Migration[5.0]
  def change
    change_column :picks, :state, :string, default: "pending"
  end
end
