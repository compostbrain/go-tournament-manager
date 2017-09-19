class CreateTournaments < ActiveRecord::Migration[5.1]
  def change
    create_table :tournaments do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :director, null: false
      t.date :begin_date, null: false
      t.date :end_date, null: false

      t.timestamps
    end
  end
end
