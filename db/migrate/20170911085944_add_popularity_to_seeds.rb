class AddPopularityToSeeds < ActiveRecord::Migration[5.0]
  def change
    add_column :seeds, :popularity, :integer
  end
end
