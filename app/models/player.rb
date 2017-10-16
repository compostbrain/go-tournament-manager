class Player < ApplicationRecord
  has_many :tournaments, through: :tournament_registrations
  has_many :games
  has_many :results, through: :games
  attr_accessor :tournament_points, :previous_opponents

  def self.sorted_by_rating
    players = Players.all
    players.sort_by(&:rating)
  end

  def full_name
    first_name.upcase + " " + last_name.upcase
  end


end
