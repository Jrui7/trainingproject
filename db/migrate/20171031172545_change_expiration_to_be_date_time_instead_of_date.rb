class ChangeExpirationToBeDateTimeInsteadOfDate < ActiveRecord::Migration[5.0]
  def change
    change_column :seeds, :expiration, :datetime
  end
end
