class AddResultsToGames < ActiveRecord::Migration[5.1]
  def change
    add_reference :games, :result, foreign_key: true
  end
end
