class Game < ApplicationRecord
  belongs_to :round
  has_one :result
end
