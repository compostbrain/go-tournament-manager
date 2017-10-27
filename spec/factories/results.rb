# == Schema Information
#
# Table name: results
#
#  id         :integer          not null, primary key
#  outcome    :integer          default("not_one")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :integer
#

FactoryGirl.define do
  factory :result do
    game
    outcome "black_won"
  end
end
