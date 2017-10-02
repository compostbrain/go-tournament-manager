class Tournament < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :location, :begin_date, :end_date
end
