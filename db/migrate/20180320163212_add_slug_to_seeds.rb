class AddSlugToSeeds < ActiveRecord::Migration[5.0]
  def change
    add_column :seeds, :slug, :string
    add_index :seeds, :slug, unique: true
  end
end
