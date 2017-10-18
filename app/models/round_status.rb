class RoundStatus < ApplicationRecord
  belongs_to :player
  belongs_to :round
  enum status: { active: 1, bye: 2}
end
