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

require 'rails_helper'

RSpec.describe TournamentRegistration, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
