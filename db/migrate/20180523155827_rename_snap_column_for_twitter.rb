class RenameSnapColumnForTwitter < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :snap, :twitter
  end
end
