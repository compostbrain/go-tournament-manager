# == Schema Information
#
# Table name: tournaments
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  location   :string           not null
#  begin_date :date             not null
#  end_date   :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

FactoryGirl.define do
  factory :tournament do
    name "Bun Yum Invitational"
    location "Washington D.C."
    begin_date "2017-09-18"
    end_date "2017-09-18"
    number_of_rounds 4
    user
  end
end
