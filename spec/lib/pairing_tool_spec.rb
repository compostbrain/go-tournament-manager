require 'rails_helper'
require "pry"
require "pairing_tool"

describe PairingTool do
  let :player1 { create(:player, rating: -30) }
  let :player2 { create(:player, rating: -30) }
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
    it "sets the players delta to initial_tournament_points + .5 for a draw" do
      tournament = FactoryGirl.create(:tournament)
      tournament_registration = FactoryGirl.create(:tournament_registration, player_id: player1.id, tournament_id: tournament.id)

      round1 = FactoryGirl.create(:round, number: 1, tournament_id: tournament.id)
      round2 = FactoryGirl.create(:round, number: 2, tournament_id: tournament.id)


      game1 = FactoryGirl.create(:game, white_player: player1, black_player: player2, round_id: round1.id)


      game1_result = FactoryGirl.create(:result, game: game1, outcome: "draw")


      pair_tool = PairingTool.new(players: [player1, player2], tournament: tournament, round: round2)
      pair_tool.send(:determine_tournament_points, player1)
      expect(player1.tournament_points).to eq(0.5)
    end

  end
  describe '#determine_previous_opponents' do
    it "adds all previous opponents to player.previous_opponents" do
      tournament = FactoryGirl.create(:tournament)
      tournament_registration = FactoryGirl.create(:tournament_registration, player_id: player1.id, tournament_id: tournament.id)

      round1 = FactoryGirl.create(:round, number: 1, tournament_id: tournament.id)
      round2 = FactoryGirl.create(:round, number: 2, tournament_id: tournament.id)
      round3 = FactoryGirl.create(:round, number: 3, tournament_id: tournament.id)

      game1 = FactoryGirl.create(:game, white_player: player3, black_player: player1, round_id: round1.id)
      game2 = FactoryGirl.create(:game, white_player: player1, black_player: player2, round_id: round2.id)

      game1_result = FactoryGirl.create(:result, game: game1, outcome: "white_won")
      game2_result = FactoryGirl.create(:result, game: game2, outcome: "white_won")

      pair_tool = PairingTool.new(players: [player1, player2, player3], tournament: tournament, round: round3)
      pair_tool.send(:determine_previous_opponents, player1)
      expect(player1.previous_opponents).to include(player2, player3)
    end

  end
  describe "#remove_bye_players" do
    it "removes any players set to receive a bye due to enum status of bye" do
      tournament = FactoryGirl.create(:tournament)
      tournament_registration = FactoryGirl.create(:tournament_registration, player_id: player1.id, tournament_id: tournament.id)

      round1 = FactoryGirl.create(:round, number: 1, tournament_id: tournament.id)

      player1.update(round_statuses_attributes: [round: round1, status: "bye"])






      pair_tool = PairingTool.new(players: [player1, player2, player3], tournament: tournament, round: round1)
      active_players = pair_tool.send(:remove_bye_players, [player1, player2, player3])
      expect(active_players).to_not include(player1)
    end

  end

  xit "sorts the field" do

  end



  describe "#execute" do
    xit "pairs players with the same delta" do
      tournament = FactoryGirl.create(:tournament)
      tournament_registration = FactoryGirl.create(:tournament_registration, player_id: player1.id, tournament_id: tournament.id, status: "final")
      tournament_registration = FactoryGirl.create(:tournament_registration, player_id: player2.id, tournament_id: tournament.id, status: "final")

      round1 = FactoryGirl.create(:round, number: 1, tournament_id: tournament.id)
      round2 = FactoryGirl.create(:round, number: 2, tournament_id: tournament.id)
      round3 = FactoryGirl.create(:round, number: 3, tournament_id: tournament.id)

      game1 = FactoryGirl.create(:game, white_player: player1, black_player: player3, round_id: round1.id)
      game2 = FactoryGirl.create(:game, white_player: player2, black_player: player4, round_id: round2.id)

      game1_result = FactoryGirl.create(:result, game: game1, outcome: "white_won")
      game2_result = FactoryGirl.create(:result, game: game2, outcome: "white_won")

      pair_tool = PairingTool.new(players: [player1, player2, player3, player4], tournament: tournament, round: round3).excecute
      expect(pair_tool).to include(player2, player3)

    end
  end
end
