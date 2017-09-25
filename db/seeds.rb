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
  Player.create!(
    first_name:
  )

last_name
rank
aga_number
  t.date "membership_exp_date", null: false
  t.decimal "rating", null: false
  t.string "chapter_affiliation", null: false
  t.string "state

puts "5 Tournaments created."
