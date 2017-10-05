class AddTournamentsToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_reference :players, :tournament, foreign_key: true
  end
end
