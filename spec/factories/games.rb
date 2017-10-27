# == Schema Information
#
# Table name: games
#
#  id              :integer          not null, primary key
#  round_id        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  result_id       :integer
#  white_player_id :integer          not null
#  black_player_id :integer          not null
#  table_number    :integer
#  stone_color     :integer
#  handicap        :integer
#

FactoryGirl.define do
  factory :game do
    round

  end
end
