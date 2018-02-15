class CreateExchanges < ActiveRecord::Migration[5.0]
  def change
    create_table :exchanges do |t|
      t.references :pick, foreign_key: true
      t.text :question

      t.timestamps
    end
  end
end
