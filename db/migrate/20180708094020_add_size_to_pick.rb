class AddSizeToPick < ActiveRecord::Migration[5.0]
  def change
    add_column :picks, :size, :string
  end
end
