FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end
  sequence :tournament_director_email do |n|
    "tournament_director#{n}@example.com"
  end

  factory :user do
    first_name "John"
    last_name "Doe"
    email { generate :tournament_director_email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end

  factory :tournament_director, class: "TournamentDirector" do
    first_name "John"
    last_name "Doe"
    email { generate :email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end
end
