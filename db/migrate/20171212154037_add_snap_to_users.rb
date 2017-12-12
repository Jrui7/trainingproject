class AddSnapToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :snap, :string
  end
end
