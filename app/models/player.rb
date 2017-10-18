class Player < ApplicationRecord
  has_many :tournament_registrations
  has_many :tournaments, through: :tournament_registrations
  has_many :round_statuses
  has_many :rounds, through: :round_statuses
  attr_accessor :tournament_points, :previous_opponents

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

  # def receive_bye
  #
  # end
end
