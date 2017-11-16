require 'rails_helper'
require "pry"
require "standings_calculator"

describe StandingsCalculator do
  let :tournament { create(:tournament) }
  let :player1 { create(:player1, rating: -30) }
  let :player2 { create(:player2, rating: 3) }
  let :tournament_registration1 {
    create(:tournament_registration,
    tournament_id: tournament.id,
    player_id: player1.id,
    )
  }
  let :tournament_registration2 {
    create(:tournament_registration,
    tournament_id: tournament.id,
    player_id: player2.id,
    )
  }

  describe "#execute" do

    it "orders players by tournament points" do
      standings = StandingsCalculator.new(players: [player1, player2], tournament: tournament).execute
      expect(standings[0]).to eq player2
    end
  end

end
