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

class Game < ApplicationRecord
  belongs_to :round
  has_one :tournament, through: :round
  has_one :result, autosave: true
  belongs_to :white_player, class_name: "Player", foreign_key: "white_player_id"
  belongs_to :black_player, class_name: "Player", foreign_key: "black_player_id"
  accepts_nested_attributes_for :result
  # enum stone_color: { player1_is_white: 1, player1_is_black: 2 }

  # after_create :setup_game_result
  #
  #
  # def setup_game_result
  #   GameResult.create(...)
  # end
end
