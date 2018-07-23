class AddStatusToSeed < ActiveRecord::Migration[5.0]
  def change
    add_column :seeds, :status, :string, default: "pending"
  end
end
