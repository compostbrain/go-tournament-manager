# == Schema Information
#
# Table name: players
#
#  id                  :integer          not null, primary key
#  first_name          :string           not null
#  last_name           :string           not null
#  rank                :string           not null
#  aga_number          :string           not null
#  membership_exp_date :date             not null
#  rating              :decimal(, )      not null
#  chapter_affiliation :string           not null
#  state               :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

FactoryGirl.define do
  factory :player do
    first_name "James"
    last_name "Doe"
    rank "7K"
    aga_number "12345"
    membership_exp_date "2017-09-25"
    rating "-7"
    chapter_affiliation "NOVA"
    state "MD"
    
  end
end
