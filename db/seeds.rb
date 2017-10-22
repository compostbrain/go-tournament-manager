require 'random_data'

@tournament_director =
  TournamentDirector.create!(
    first_name: "Jason",
    last_name: "Bourne",
    email: "jason@dragonslayer.com",
    password: "asdfasdf",
    password_confirmation: "asdfasdf"
  )


5.times do |tournament|
  date = Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today)
  Tournament.create!(
    user_id: @tournament_director.id,
    name: Faker::Hobbit.quote,
    location: Faker::Hobbit.location,
    begin_date: date,
    end_date: date + 1
  )
end
tournaments = Tournament.all

4.times do |round|
  Round.create!(number: round, tournament_id: tournaments.first.id)
end

100.times do |player|
  fake_rank = RandomData.random_rank
  Player.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    rank: fake_rank,
    aga_number: Faker::Number.number(5),
    membership_exp_date: Faker::Date.between_except(1.year.from_now, 2.year.from_now, Date.today),
    rating: RandomData.rating_from_rank(fake_rank),
    chapter_affiliation: RandomData.random_chapter,
    state: Faker::Address.state_abbr,

  )
end

puts "1 Tournament Director Created: jason@dragonslayer.com"
puts "5 Tournaments with 4 rounds each created."
puts "100 Players created."
