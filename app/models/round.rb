# == Schema Information
#
# Table name: rounds
#
#  id            :integer          not null, primary key
#  tournament_id :integer
#  number        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Round < ApplicationRecord
  belongs_to :tournament
  has_many :round_statuses
  has_many :players, through: :round_statuses, foreign_key: "player_id"
  has_many :games, dependent: :destroy
  validates :number, presence: true

  def active_players
    players.joins(:round_statuses).where(round_statuses: { id: id, status: 1 })
  end
end
