class Tournament < ApplicationRecord
  belongs_to :user
  has_many :rounds, dependent: :destroy
  has_many :players, dependent: :destroy
  validates_presence_of :name, :location, :begin_date, :end_date
end
