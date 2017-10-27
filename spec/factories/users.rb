# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  first_name             :string
#  last_name              :string
#  type                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

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
