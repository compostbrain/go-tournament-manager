class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :first_name , null: false
      t.string :last_name, null: false
      t.string :rank, null: false
      t.string :aga_number, null: false
      t.date :membership_exp_date
      t.decimal :rating, null: false
      t.string :chapter_affiliation, null: false
      t.string :state, null: false

      t.timestamps
    end
  end
end
