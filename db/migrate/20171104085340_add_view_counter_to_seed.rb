class AddViewCounterToSeed < ActiveRecord::Migration[5.0]
  def change
    add_column :seeds, :view_counter, :integer
  end
end
