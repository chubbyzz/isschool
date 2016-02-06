require 'rails_helper'

RSpec.describe Classroom, type: :model do
  it{should belong_to(:course)}
  it{should belong_to(:student)}

  it{should validate_presence_of(:course_id)}
  it{should validate_presence_of(:student_id)}

  it 'should not have a student in a same course twice' do
    classrooms  = build_pair(:classroom, course_id: 1, student_id: 1)
    classrooms.first.save
    expect(classrooms.last.save).to be_falsey
  end

  it 'should get the right now time on create' do
    classroom = Classroom.new
    expect(classroom.entry_at).to_not be_nil
  end
end
