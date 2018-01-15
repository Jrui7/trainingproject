class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.references :seed, foreign_key: true
      t.string :status, default: "pending"
      t.integer :price

      t.timestamps
    end
  end
end
