class AddReminderToPicks < ActiveRecord::Migration[5.0]
  def change
    add_column :picks, :reminder, :boolean, default: false
  end
end
