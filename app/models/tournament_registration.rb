class TournamentRegistration < ApplicationRecord
  belongs_to :player
  belongs_to :tournament
  enum status: { preliminary: 1, final: 2 }
end
