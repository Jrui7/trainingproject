class DropVideos < ActiveRecord::Migration[5.0]
  def change
    drop_table :videos
  end
end
