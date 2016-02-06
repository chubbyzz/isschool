FactoryGirl.define do
  factory :course do
    skip_create
    name Faker::Name.name
    description Faker::Lorem.name
    status Faker::Number.between(1,2)
  end
end