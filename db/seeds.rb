require 'RandomData'
1.times do |tournament_director|
  TournamentDirector.create!(
    first_name: "Jason",
    last_name: "Bourne",
    email: "jason@dragonslayer.com",
    password: "asdfasdf",
    password_confirmation: "asdfasdf"
  )
end

5.times do |tournament|
  date = Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today)
  Tournament.create!(
    name: Faker::Hobbit.quote,
    location: Faker::Hobbit.location,
    director: Faker::Hobbit.character,
    begin_date: date,
    end_date: date + 1
  )
end

100.times do |player|
  fake_rank = RandomData.random_rank,
  Player.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    rank: fake_rank
    aga_number: Faker::Number.decimal(1,3),
    membership_exp_date: Faker::Date.between_except(1.from_now, 2.year.from_now, Date.today),
    rating:
    chapter_affiliation: RandomData.random_chapter,
    state: Faker::Address.state_abbr
  )

puts "1 Tournament Director Created: jason@dragonslayer.com"
puts "5 Tournaments created."
puts "100 Players created."
