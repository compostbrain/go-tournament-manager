class AddStoneColorToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :stone_color, :integer
  end
end
