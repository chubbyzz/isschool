require 'rails_helper'


RSpec.describe ClassroomsController, type: :controller do
  # context 'need to source the courses and students' do
  #   before do
  #     check_list(Course, [Faker::Lorem::words(3), 1])
  #     check_list(Student, [Faker::Lorem::words(3), 1])
  #   end
  #
  #   it 'should sigh a student in a course' do
  #     allow(Classroom).to receive(:create).and_return(build(:classroom, course_id: 123))
  #     # allow(Classroom).to receive(:save).and_return(true)
  #     post :create, {classroom: {student_id: 1, course_id: 1}}
  #     expect(response).to redirect_to course_path(123)
  #   end
  #
  #   it 'should redirect to create form' do
  #     get :new
  #     expect(response).to render_template(:new)
  #   end
  # end
  # context 'need to be redirect courses or students is empty' do
  #
  #   it 'should redirect because courses is empty' do
  #     check_list(Course, [])
  #     check_list(Student, [Faker::Lorem::words(3), 1])
  #     get :new
  #     expect(response).to redirect_to courses_path
  #   end
  #
  #   it 'should redirect because students is empty' do
  #     check_list(Course, [Faker::Lorem::words(3), 1])
  #     check_list(Student, [])
  #     get :new
  #     expect(response).to redirect_to students_path
  #   end
  #
  #   it 'should redirect to courses because bough are empty' do
  #     check_list(Course, [])
  #     check_list(Student, [])
  #     get :new
  #     expect(response).to redirect_to courses_path
  #   end
  #
  #   it 'should redirect because courses is empty' do
  #     check_list(Course, [])
  #     check_list(Student, [Faker::Lorem::words(3), 1])
  #     post :create, {classroom: {student_id: 1, course_id: 1}}
  #     expect(response).to redirect_to courses_path
  #   end
  #
  #   it 'should redirect because students is empty' do
  #     check_list(Course, [Faker::Lorem::words(3), 1])
  #     check_list(Student, [])
  #     post :create, {classroom: {student_id: 1, course_id: 1}}
  #     expect(response).to redirect_to students_path
  #   end
  #
  #   it 'should redirect to courses because bough are empty' do
  #     check_list(Course, [])
  #     check_list(Student, [])
  #     post :create, {classroom: {student_id: 1, course_id: 1}}
  #     expect(response).to redirect_to courses_path
  #   end
  #
  # end
end

private
  def check_list(object, and_return)
    allow(object).to receive_message_chain(:all, :pluck).and_return(and_return)
  end