40.times do
  Alien.create!(
   name: Faker::Superhero.name,
   year: Random.rand(1948..1954),
   month: Random.rand(1..12),
   origin: Faker::Space.galaxy
  )
end
aliens = Alien.all

70.times do
  Power.create!(
   ability: Faker::Superhero.power,
   alien: aliens.sample
  )
end

puts "Seed finished"
puts "#{Alien.count} aliens created"
puts "#{Power.count} powers created"
