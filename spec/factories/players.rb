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
    tournament
  end
end
