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

FactoryGirl.define do
  factory :round_status do
    player nil
    round nil
    status 1
  end
end
