class Result < ApplicationRecord
  belongs_to :game

  enum result: %w(not_one white_won black_won draw white_forfeit black_forfeit)

  def player1
    game.player1
  end

  def player2
    game.player2
  end
end
