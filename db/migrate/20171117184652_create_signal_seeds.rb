class CreateSignalSeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :signal_seeds do |t|
      t.references :user, foreign_key: true
      t.references :seed, foreign_key: true

      t.timestamps
    end
  end
end
