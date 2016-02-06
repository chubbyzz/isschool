require 'rails_helper'

RSpec.describe StudentsController, type: :controller do

  it 'should list Students' do
    allow(Student).to receive_message_chain(:all, :includes).with(:student_status)
    get :index
    expect(response).to render_template :index
  end

  it 'should go to create form' do
    allow(Student).to receive(:new).once
    get :new
    expect(response).to render_template :new
  end

  it 'should create a new record' do
    student = build(:student)
    allow(Student).to receive(:create).once.and_return(student)
    allow(student).to receive(:valid?).once.and_return(true)
    post :create, student: {name: student.name, register_number: student.register_number, status: student.status}
    expect(response).to redirect_to student
  end

  it 'should fail on create a new record' do
    student = build(:student)
    allow(Student).to receive(:create).once.and_return(student)
    allow(student).to receive(:valid?).once.and_return(false)
    post :create, student: {name: '', register_number: '', status: ''}
    expect(response).to render_template :new
  end

  context 'should find a Student' do
    let(:student) { build(:student, id:1)}
    before do
      allow(Student).to receive(:find).once.with('1').and_return(student)
    end

    it 'should show the student' do
      get :show, id: student.id
      expect(response).to render_template :show
    end
    it 'should go to edit student`s from' do
      get :show, id: student.id
      expect(response).to render_template :show
    end
    it 'should remove a student' do
      allow(student).to receive(:destroy)
      delete :destroy, id: student.id
      expect(response).to redirect_to students_url
    end

    it 'should update a record' do
      params =  {name: student.name, register_number: student.register_number, status: student.status}
      allow(student).to receive(:update).once.and_return(student)
      put :update, id: student.id,student: params
      expect(response).to redirect_to student
    end

    it 'should fail on update a record' do
      allow(student).to receive(:update).once.and_return(false)
      put :update, id: student.id, student: {name: '', register_number: '', status: ''}
      expect(response).to render_template :edit
    end

  end
end
