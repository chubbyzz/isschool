require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  it 'should sigh a student in a course' do
    classroom = build(:classroom, course_id: 3)
    allow(Classroom).to receive(:create).and_return(classroom)
    post :apply, {student_id: classroom.student_id, course_id: classroom.course_id}
    expect(response).to redirect_to course_path(classroom.course_id)
    expect(flash[:notice]).to eql('Save successfully')
  end

  it 'should alert when sigh a student in a course fails' do
    classroom = build(:classroom, course_id: 3)
    allow(Classroom).to receive(:create).and_return(false)
    post :apply, {student_id: classroom.student_id, course_id: classroom.course_id}
    expect(response).to redirect_to course_path(classroom.course_id)
    expect(flash[:notice]).to eql('Something wrong happens')
  end

  it 'should list Course' do
    allow(Course).to receive_message_chain(:all, :includes).with(:course_status)
    get :index
    expect(response).to render_template :index
  end

  it 'should go to create form' do
    allow(Course).to receive(:new).once
    get :new
    expect(response).to render_template :new
  end

  it 'should create a new record' do
    course = build(:course)
    allow(Course).to receive(:create).once.and_return(course)
    post :create, course: {name: course.name, description: course.description, status: course.status}
    expect(response).to redirect_to course
  end
  it 'should fail on create a new record' do
    allow(Course).to receive(:create).once.and_return(false)
    post :create, course: {name: '', description: '', status: ''}
    expect(response).to render_template :new
  end

  context 'should find a Student' do
    let(:course) { build(:course, id: 1) }
    before do
      allow(Course).to receive(:find).once.with('1').and_return(course)
    end

    it 'should show the student' do
      get :show, id: course.id
      expect(response).to render_template :show
    end
    it 'should go to edit student`s from' do
      get :show, id: course.id
      expect(response).to render_template :show
    end
    it 'should remove a student' do
      allow(course).to receive(:destroy)
      delete :destroy, id: course.id
      expect(response).to redirect_to courses_url
    end

    it 'should update a record' do
      params = {course: course.name, description: course.description, status: course.status}
      allow(course).to receive(:update).once.and_return(course)
      put :update, id: course.id, course: params
      expect(response).to redirect_to course
    end
    it 'should fail on update a record' do
      allow(course).to receive(:update).once.and_return(false)
      put :update, id: course.id, course: {name: '', description: '', status: ''}
      expect(response).to render_template :edit
    end
  end
end
