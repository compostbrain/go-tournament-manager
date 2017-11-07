class CreateTournamentRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :tournament_registrations do |t|
      t.integer :status, default: 1
      t.timestamps
    end
  end
end
