class CreatePicks < ActiveRecord::Migration[5.0]
  def change
    create_table :picks do |t|
      t.integer :price
      t.references :seed, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
