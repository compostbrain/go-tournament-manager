# == Schema Information
#
# Table name: results
#
#  id         :integer          not null, primary key
#  outcome    :integer          default("not_one")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :integer
#

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

  def loser
    if outcome == "not_one" || outcome == "draw"
      nil
    elsif outcome == "white_won" || outcome == "black_forfeit"
      black_player
    else
      white_player
    end
  end

  def draw
    if outcome == "draw"
      true
    end
  end
end
