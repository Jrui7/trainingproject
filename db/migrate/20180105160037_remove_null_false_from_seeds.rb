class RemoveNullFalseFromSeeds < ActiveRecord::Migration[5.0]
  def change
    change_column_null :seeds, :price_cents, true
  end
end
