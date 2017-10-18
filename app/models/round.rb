class Round < ApplicationRecord
  belongs_to :tournament
  has_many :round_statuses
  has_many :players, through: :round_statuses
  has_many :games, dependent: :destroy
  validates :number, presence: true
end
