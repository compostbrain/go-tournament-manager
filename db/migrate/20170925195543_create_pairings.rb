class CreatePairings < ActiveRecord::Migration[5.1]
  def change
    create_table :pairings do |t|
      t.references :round, foreign_key: true

      t.timestamps
    end
  end
end
