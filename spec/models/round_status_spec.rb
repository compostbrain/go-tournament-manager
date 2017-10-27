# == Schema Information
#
# Table name: round_statuses
#
#  id         :integer          not null, primary key
#  player_id  :integer
#  round_id   :integer
#  status     :integer          default("active")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe RoundStatus, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
