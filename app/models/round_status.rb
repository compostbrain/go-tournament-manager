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

class RoundStatus < ApplicationRecord
  belongs_to :player
  belongs_to :round
  enum status: { active: 1, bye: 2 }
end
