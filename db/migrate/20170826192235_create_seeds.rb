class CreateSeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :seeds do |t|
      t.string :title
      t.text :description
      t.date :expiration
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
