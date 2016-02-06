class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_students, only: [:show]

  def index
    @courses = Course.all.includes(:course_status)
  end

  def create
    @course = Course.create(course_params)
    if @course.valid?
      redirect_to @course, notice: 'Course was successfully created.'
    else
      render :new
    end
  end

  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_url, notice: 'Course was successfully destroyed.'
  end

  def show
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def apply
    alert = (@classroom = Classroom.create(classroom_params)) ? 'Save successfully' : 'Something wrong happens'
    redirect_to course_path(classroom_params['course_id']), notice: alert
  end


  private

  def set_course
    @course = Course.find(params[:id])
  end

  def set_students
    @classroom = Classroom.new course_id: @course.id
    @students = Student.includes(:classrooms).where(classrooms: {id: nil}).pluck :name, :id

  end

  def course_params
    params.require(:course).permit(:name, :description, :status)
  end

  def classroom_params
    params.permit(:student_id, :course_id)
  end
end
