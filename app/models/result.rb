class Result < ApplicationRecord
  belongs_to :game

  enum outcome: %w(not_one draw white_won black_forfeit black_won white_forfeit)

  def white_player
    game.white_player
  end

  def black_player
    game.black_player
  end

  def winner
    if outcome == "not_one" || outcome == "draw"
      nil
    elsif outcome == "white_won" || outcome == "black_forfeit"
      white_player
    else
      black_player
    end
  end

  def draw
    if outcome == "draw"
      true
    end
  end
end
