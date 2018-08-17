
FactoryBot.define do
  factory :user do
    name { Faker::Simpsons.character }
    username { Faker::Superhero.name}
    password { "starwars" }
  end
end
