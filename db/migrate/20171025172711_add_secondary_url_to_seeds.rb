class AddSecondaryUrlToSeeds < ActiveRecord::Migration[5.0]
  def change
    add_column :seeds, :secondary_url, :string
  end
end
