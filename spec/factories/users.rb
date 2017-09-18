FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    first_name "John"
    last_name "Doe"
    email { generate :email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
    # phone "5551231234"
  end
end
