class Round < ApplicationRecord
  belongs_to :tournament
  has_many :games, dependent: :destroy
  validates :number, presence: true
end
