# == Schema Information
#
# Table name: results
#
#  id         :integer          not null, primary key
#  outcome    :integer          default("undecided")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :integer
#

class Result < ApplicationRecord
  belongs_to :game

  enum outcome: {
    undecided: 0,
    white_won: 1,
    black_won: 2,
    white_forfeit: 3,
    black_forfeit: 4,
    draw: 5,
  }

  def white_player
    game.white_player
  end

  def black_player
    game.black_player
  end

  def winner
    if outcome == "undecided" || outcome == "draw"
      nil
    elsif outcome == "white_won" || outcome == "black_forfeit"
      white_player
    else
      black_player
    end
  end

  def loser
    if outcome == "undecided" || outcome == "draw"
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
