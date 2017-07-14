FactoryGirl.define do
  factory :alien do
    name Faker::Superhero.name
    year Random.rand(1948..1954)
    month Random.rand(1..12)
    origin Faker::Space.galaxy
  end
end
