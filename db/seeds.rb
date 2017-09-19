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

puts "5 Tournaments created."
