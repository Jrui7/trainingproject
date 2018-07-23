class AddDefaultValueToViewAndPopularityCounter < ActiveRecord::Migration[5.0]
  def change
    change_column :seeds, :popularity, :integer, default: 0
    change_column :seeds, :view_counter, :integer, default: 0
  end
end
