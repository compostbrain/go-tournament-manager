class AddReferencesToTournamentRegistrations < ActiveRecord::Migration[5.1]
  def change
    add_reference :tournament_registrations, :player, foreign_key: true
    add_reference :tournament_registrations, :tournament, foreign_key: true
  end
end
