class AddUrlToSeeds < ActiveRecord::Migration[5.0]
  def change
    add_column :seeds, :url, :string
  end
end
