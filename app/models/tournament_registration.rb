# == Schema Information
#
# Table name: tournament_registrations
#
#  id            :integer          not null, primary key
#  status        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  player_id     :integer
#  tournament_id :integer
#

class TournamentRegistration < ApplicationRecord
  belongs_to :player
  belongs_to :tournament
  enum status: { preliminary: 1, final: 2 }
end
