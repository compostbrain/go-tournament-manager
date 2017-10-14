class AddAttributesToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :player1_id, :integer, null: false
    add_column :games, :player2_id, :integer, null: false
    add_column :games, :table_number, :integer
  end
end
