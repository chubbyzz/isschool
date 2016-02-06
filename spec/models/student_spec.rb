require 'rails_helper'

RSpec.describe Student, type: :model do
  it{should have_many(:classrooms)}
  it{should have_many(:courses).through(:classrooms)}
  it{should belong_to(:student_status)}

  it{should validate_length_of(:name).is_at_least(3).is_at_most(45)}
  it{should validate_length_of(:register_number).is_at_least(3).is_at_most(45)}
  it{should validate_inclusion_of(:status).in_array([1,2])}
end
