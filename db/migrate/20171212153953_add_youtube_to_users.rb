class AddYoutubeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :youtube, :string
  end
end
