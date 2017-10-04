class Player < ApplicationRecord
  belongs_to :tournament

  def self.sorted_by_rating
    players = Players.all
    players.sort_by(&:rating)
  end
end
