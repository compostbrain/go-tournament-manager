# == Schema Information
#
# Table name: players
#
#  id                  :integer          not null, primary key
#  first_name          :string           not null
#  last_name           :string           not null
#  rank                :string           not null
#  aga_number          :string           not null
#  membership_exp_date :date             not null
#  rating              :decimal(, )      not null
#  chapter_affiliation :string           not null
#  state               :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Player < ApplicationRecord
  has_many :tournament_registrations
  has_many :tournaments, through: :tournament_registrations
  has_many :round_statuses
  has_many :rounds, through: :round_statuses
  accepts_nested_attributes_for :round_statuses
  accepts_nested_attributes_for :tournament_registrations
  attr_accessor :tournament_points, :previous_opponents
<<<<<<< HEAD
  validates_uniqueness_of :email
  validates_uniqueness_of :aga_number
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :aga_number, presence: true
  validates :email, presence: true
  validates :rank, presence: true
  validates :rating, presence: true
=======
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :rank, presence: true
  validates :aga_number, presence: true
  validates :rating, presence: true
  default_scope { order("rating DESC") }
>>>>>>> 4e7a57064503ab188e0b1b4aab7399261324fe98

  def self.sorted_by_rating
    players = Players.all
    players.sort_by(&:rating)
  end

  def full_name
    first_name.upcase + " " + last_name.upcase
  end

  def games
    Game.where("white_player_id = ? OR black_player_id = ?", id, id)
  end
end
