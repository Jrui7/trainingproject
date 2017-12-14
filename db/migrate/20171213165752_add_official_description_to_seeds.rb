class AddOfficialDescriptionToSeeds < ActiveRecord::Migration[5.0]
  def change
    add_column :seeds, :official_description, :text
  end
end
