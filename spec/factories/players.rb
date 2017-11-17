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
    factory :player1, parent: :player do
      first_name "James"
      last_name "Doe"
      rank "7K"
      aga_number "12345"
      membership_exp_date "2017-09-25"
      rating "-7"
      chapter_affiliation "NOVA"
      state "MD"
      phone "1234567890"
      email "player1@test.com"
      zip "12345"
    end

    factory :player2, parent: :player do
      first_name "Player"
      last_name "Two"
      rank "7K"
      aga_number "99992"
      membership_exp_date "2017-09-25"
      rating "-7"
      chapter_affiliation "NOVA"
      state "MD"
      phone "1234567890"
      email "player2@test.com"
      zip "12345"
    end
    factory :player3, parent: :player do
      first_name "Player"
      last_name "Three"
      rank "7K"
      aga_number "99993"
      membership_exp_date "2017-09-25"
      rating "-7"
      chapter_affiliation "NOVA"
      state "MD"
      phone "1234567890"
      email "player3@test.com"
      zip "12345"
    end
    factory :player4, parent: :player do
      first_name "Player"
      last_name "four"
      rank "7K"
      aga_number "99994"
      membership_exp_date "2017-09-25"
      rating "-7"
      chapter_affiliation "NOVA"
      state "MD"
      phone "1234567890"
      email "player4@test.com"
      zip "12345"
    end
  end
end
