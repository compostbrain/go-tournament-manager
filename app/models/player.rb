class Player < ApplicationRecord
  has_many :tournament_registrations
  has_many :tournaments, through: :tournament_registrations
  has_many :round_statuses
  has_many :rounds, through: :round_statuses
  accepts_nested_attributes_for :round_statuses
  attr_accessor :tournament_points, :previous_opponents

  def self.with_final_registration_statuses(tournament)
  Player.joins(:tournament_registrations).where(tournament_registrations: {tournament_id: tournament.id, status: "final"})
  end

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
