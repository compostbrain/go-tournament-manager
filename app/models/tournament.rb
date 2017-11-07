class Tournament < ApplicationRecord
  belongs_to :user, required: false
  has_many :rounds, dependent: :destroy
  has_many :tournament_registrations
  has_many :players, through: :tournament_registrations
  validates :name, presence: true,
                   uniqueness: {
                                scope: :begin_date,
                                message: "Should only happen once per year"
                                }
  validates :location, presence: true
  validates :begin_date, presence: true
  validates :end_date, presence: true
  attr_accessor :number_of_rounds
end
