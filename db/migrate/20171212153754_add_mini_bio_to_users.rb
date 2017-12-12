class AddMiniBioToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mini_bio, :text
  end
end
