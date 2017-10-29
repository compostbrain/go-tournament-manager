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
      aga_number "99999"
      membership_exp_date "2017-09-25"
      rating "-7"
      chapter_affiliation "NOVA"
      state "MD"
      phone "1234567890"
      email "player2@test.com"
      zip "12345"
    end
  end
end
