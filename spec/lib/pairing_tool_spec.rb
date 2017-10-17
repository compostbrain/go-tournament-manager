require 'rails_helper'
require "pry"
require "pairing_tool"

describe PairingTool do
  let :player1 { create(:player, rating: -30) }
  let :player2 { create(:player, rating: 6) }
  let :player3 { create(:player, rating: -5) }
  let :player4 { create(:player, rating: 4) }




  describe '#determine_tournament_points' do
    it "sets the players delta to initial_tournament_points + 2 for winning two games" do
      tournament = FactoryGirl.create(:tournament)
      tournament_registration = FactoryGirl.create(:tournament_registration, player_id: player1.id, tournament_id: tournament.id)

      round1 = FactoryGirl.create(:round, number: 1, tournament_id: tournament.id)
      round2 = FactoryGirl.create(:round, number: 2, tournament_id: tournament.id)
      round3 = FactoryGirl.create(:round, number: 3, tournament_id: tournament.id)

      game1 = FactoryGirl.create(:game, white_player: player1, black_player: player2, round_id: round1.id)
      game2 = FactoryGirl.create(:game, white_player: player1, black_player: player2, round_id: round2.id)

      game1_result = FactoryGirl.create(:result, game: game1, outcome: "white_won")
      game2_result = FactoryGirl.create(:result, game: game2, outcome: "white_won")

      pair_tool = PairingTool.new(players: [player1, player2], tournament: tournament, round: round3)
      pair_tool.send(:determine_tournament_points, player1)
      expect(player1.tournament_points).to eq(2)
    end

  end
  xit "removes players receiving byes" do

  end

  xit "sorts the field" do

  end

  xit "creates score groups" do

  end

  xit " pairs each score group"
end
