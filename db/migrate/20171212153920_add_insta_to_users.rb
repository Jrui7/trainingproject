class AddInstaToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :insta, :string
  end
end
