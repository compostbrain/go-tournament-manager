class AddAttributesToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :white_player_id, :integer, null: false
    add_column :games, :black_player_id, :integer, null: false
    add_column :games, :table_number, :integer
  end
end
