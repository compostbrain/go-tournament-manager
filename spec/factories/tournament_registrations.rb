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

FactoryGirl.define do
  factory :tournament_registration do
    status 1
    
  end
end
