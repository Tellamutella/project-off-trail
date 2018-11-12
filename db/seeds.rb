puts 'Creating 100 fake trash...'
100.times do
  user = User.new(
    is_scout: [true,false].sample,
    email: Faker::Internet.email,
    first_name: Faker::GameOfThrones.character,
    last_name: Faker::GameOfThrones.character,
    password: Faker::Internet.password,
    location: Faker::Address.country
  )
  user.save!
end

scout = User.all.select { |user| user.is_scout }

scout.each do |scout|
  rand(1..5).times do
    location = Location.new(
      name: Faker::FunnyName.name,
      description: Faker::DragonBall.character,
      coordinates: Faker::Address.full_address,
      price: rand(1..50)
      )
    location.user_id = scout.id
    location.save!
  end
end

puts 'Finished!'
