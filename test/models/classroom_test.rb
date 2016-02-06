require 'test_helper'

class ClassroomTest < ActiveSupport::TestCase
  test 'Should pass a existent student and course' do
    post :create, classroom: {stutants_id: 1, courses_id: 1}
    Student.find :class
  end

  test 'Should create an classroom' do
    assert_difference 'Classroom.count' do
      post :create, classroom: {stutants_id: 1, courses_id: 1}
    end
  end
end
