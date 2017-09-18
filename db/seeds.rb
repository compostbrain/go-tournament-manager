5.times do |tournament|
  Tournament.create!(
    name: Faker::Hobbit.quote,
    location: Faker::Hobbit.location,
    director: Faker::Hobbit.character,
    begin_date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
    end_date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today)
  )
end

puts "5 Tournaments created."
