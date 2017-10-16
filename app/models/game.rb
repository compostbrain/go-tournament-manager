class Game < ApplicationRecord
  has_one :tournament, through: :round
  has_one :result
  belongs_to :player1, class_name: "Player"
  belongs_to :player2, class_name: "Player"
  enum stone_color: { player1_is_white: 1, player1_is_black: 2 }
end
