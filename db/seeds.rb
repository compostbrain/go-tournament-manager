require 'random_data'
require "aga_number"
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
  Round.create!(number: round + 1, tournament_id: tournaments.first.id)
end

100.times do |player|
  fake_rank = RandomData.random_rank
  first_name = Faker::Name.first_name
  Player.create!(
    first_name: first_name,
    last_name: Faker::Name.last_name,
    rank: fake_rank,
    aga_number: AgaNumber.auto_assign!,
    membership_exp_date: Faker::Date.between_except(1.year.from_now, 2.year.from_now, Date.today),
    rating: RandomData.rating_from_rank(fake_rank),
    chapter_affiliation: RandomData.random_chapter,
    state: Faker::Address.state_abbr,
    email: Faker::Internet.email(first_name),
  )
end

50.times do |i|
  player = Player.find(i + 1)
  TournamentRegistration.create!(player_id: player.id, tournament_id: Tournament.first.id, status: "final")
end

4.times do |i|
  tournament = Tournament.first
  round = tournament.rounds.find_by(number: i +1 )
  players =Player.joins(:tournament_registrations).where(tournament_registrations: {tournament_id: tournament.id, status: "final"})
  players.each do |player|
    RoundStatus.create(round_id: round.id, player_id: player.id, status: "active")
  end
end


  round = Round.first
  tournament = round.tournament
  players = round.players
  pairings = PairingTool.new(
    players: players, tournament: tournament, round: round,
  ).execute
  games = []
  pairings.each_with_index do |pairing, i|
    games << if pairing[0].rating >= pairing[1].rating
                Game.create!(
                  round_id: round.id,
                  white_player_id: pairing[0].id,
                  black_player_id: pairing[1].id,
                  table_number: i,
                )
              else
                Game.create!(
                  round_id: round.id,
                  white_player_id: pairing[1].id,
                  black_player_id: pairing[0].id,
                  table_number: i,
                )

              end
  end





puts "1 Tournament Director Created: jason@dragonslayer.com"
puts "5 Tournaments with 4 rounds each created."
puts "100 Players created."
puts "50 Tournament Registrations created with registered players active in all rounds"
puts "25 games created for first round"
puts "50 tournament registrations created."
