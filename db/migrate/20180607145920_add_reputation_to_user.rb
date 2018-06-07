class AddReputationToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :reputation, :float , :default => 1.0
  end
end
