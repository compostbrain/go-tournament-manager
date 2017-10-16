class TournamentRegistration < ApplicationRecord
  belongs_to :player
  belomgs_to :tournament
  enum status: { preliminary: 1, final: 2 }
end
