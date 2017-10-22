class AddHandicapToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :handicap, :integer
  end
end
