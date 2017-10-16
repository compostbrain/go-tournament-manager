require 'rails_helper'
require 'pry'

RSpec.describe Result, type: :model do
  describe '#winner' do

    it "returns nil if outcome is equal to not_one" do
      white_player = FactoryGirl.create(:player)
      black_player = FactoryGirl.create(:player)
      game = FactoryGirl.create(:game, white_player: white_player, black_player: black_player)
      result = FactoryGirl.create(:result, game: game, outcome: "not_one")
      expect(result.winner).to eq(nil)
    end
    it "returns nil if outcome is equal to draw" do
      white_player = FactoryGirl.create(:player)
      black_player = FactoryGirl.create(:player)
      game = FactoryGirl.create(:game, white_player: white_player, black_player: black_player)
      result = FactoryGirl.create(:result, game: game, outcome: "draw")
      expect(result.winner).to eq(nil)
    end
    it "returns white_player if outcome is equal to white_won" do
      white_player = FactoryGirl.create(:player)
      black_player = FactoryGirl.create(:player)
      game = FactoryGirl.create(:game, white_player: white_player, black_player: black_player)
      result = FactoryGirl.create(:result, game: game, outcome: "white_won")
      expect(result.winner).to eq(white_player)
    end
    it "returns white_player if outcome is equal to black_forfeit" do
      white_player = FactoryGirl.create(:player)
      black_player = FactoryGirl.create(:player)
      game = FactoryGirl.create(:game, white_player: white_player, black_player: black_player)
      result = FactoryGirl.create(:result, game: game, outcome: "black_forfeit")
      expect(result.winner).to eq(white_player)
    end
    it "returns black_player if outcome is equal to black_won" do
      white_player = FactoryGirl.create(:player)
      black_player = FactoryGirl.create(:player)
      game = FactoryGirl.create(:game, white_player: white_player, black_player: black_player)
      result = FactoryGirl.create(:result, game: game, outcome: "black_won")
      expect(result.winner).to eq(black_player)
    end
    it "returns black_player if outcome is equal to white_forfeit" do
      white_player = FactoryGirl.create(:player)
      black_player = FactoryGirl.create(:player)
      game = FactoryGirl.create(:game, white_player: white_player, black_player: black_player)
      result = FactoryGirl.create(:result, game: game, outcome: "white_forfeit")
      expect(result.winner).to eq(black_player)
    end


  end
end
