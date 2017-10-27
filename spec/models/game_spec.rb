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

require 'rails_helper'

RSpec.describe Game, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
