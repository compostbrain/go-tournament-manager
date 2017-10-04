class Round < ApplicationRecord
  belongs_to :tournament
  has_many :pairings
  validates :number, presence: true
end
