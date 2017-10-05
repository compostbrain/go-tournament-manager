class Round < ApplicationRecord
  belongs_to :tournament
  has_many :games
  validates :number, presence: true
end
