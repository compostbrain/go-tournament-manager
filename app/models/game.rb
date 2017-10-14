class Game < ApplicationRecord
  belongs_to :round
  has_one :result
  belongs_to :player1, class_name: "Player"
  belongs_to :player2, class_name: "Player"
end
