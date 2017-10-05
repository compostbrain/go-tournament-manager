class RenamePairingsToGames < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :pairings, :games
  end
  def self.down
    rename_table :games, :pairings
  end
end
