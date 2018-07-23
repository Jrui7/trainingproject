class AddColumnExpeditionCostsToSeeds < ActiveRecord::Migration[5.0]
  def change
    add_column :seeds, :expedition_costs, :float
  end
end
