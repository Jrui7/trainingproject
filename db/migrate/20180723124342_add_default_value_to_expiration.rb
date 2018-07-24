class AddDefaultValueToExpiration < ActiveRecord::Migration[5.0]
  def change
    change_column :seeds, :expiration, :datetime, default: DateTime.now.utc
  end
end
