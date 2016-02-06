FactoryGirl.define do
  factory :student do
    skip_create
    name Faker::Name.name
    register_number Faker::Lorem.characters(10)
    status Faker::Number.between(1,2)
  end
end