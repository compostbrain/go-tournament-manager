require 'rails_helper'
require "pry"

describe "pairing tool" do
  let :player1 { create(:player, rating: 2) }
  let :player2 { create(:player, rating: 6) }
  let :player3 { create(:player, rating: -5) }
  let :player4 { create(:player, rating: 4) }




  describe '#determine_tournament_points' do
    it "sets the players delta to initial_tournament_points + 2 for winning the previous two rounds" do
      tournament = FactoryGirl.create(:tournament)
      player1.update(tournament_id: tournament.id)
      game = FactoryGirl.create(:game, player1: player1, player2: player2)
      round1 = FactoryGirl.create(:round, number: 1)
      round2 = FactoryGirl.create(:round, number: 2)

      binding.pry
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
