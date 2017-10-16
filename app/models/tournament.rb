class Tournament < ApplicationRecord
  belongs_to :user
  has_many :rounds, dependent: :destroy
  has_many :players, through: :tournament_registartions
  validates :name, presence: true
  validates :location, presence: true
  validates :begin_date, presence: true
  validates :end_date, presence: true
  attr_accessor :number_of_rounds
end
