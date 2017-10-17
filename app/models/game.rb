class Game < ApplicationRecord
  belongs_to :round
  has_one :tournament, through: :round
  has_one :result
  belongs_to :white_player, class_name: "Player", foreign_key: "white_player_id"
  belongs_to :black_player, class_name: "Player", foreign_key: "black_player_id"
  # enum stone_color: { player1_is_white: 1, player1_is_black: 2 }
end
