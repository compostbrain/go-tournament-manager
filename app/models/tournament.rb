class Tournament < ApplicationRecord
  validates_presence_of :name, :location, :director, :begin_date, :end_date
end
