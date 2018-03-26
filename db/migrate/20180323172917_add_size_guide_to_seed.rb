class AddSizeGuideToSeed < ActiveRecord::Migration[5.0]
  def change
    add_column :seeds, :size_guide, :string
  end
end
