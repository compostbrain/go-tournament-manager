class CreateTournaments < ActiveRecord::Migration[5.1]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :location
      t.string :director
      t.date :begin_date
      t.date :end_date

      t.timestamps
    end
  end
end
