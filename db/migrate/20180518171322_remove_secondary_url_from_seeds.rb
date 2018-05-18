class RemoveSecondaryUrlFromSeeds < ActiveRecord::Migration[5.0]
  def change
    remove_column :seeds, :secondary_url
  end
end
