FactoryGirl.define do
  factory :classroom do
    skip_create
    student_id Faker::Number.number(3)
    course_id Faker::Number.number(3)
    entry_at Faker::Date.forward(100)
  end
end