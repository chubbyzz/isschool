class StudentsController < ApplicationController
  before_action :set_student, except: [:new, :index,:create]

  def show
  end

  def edit
  end

  def new
    @student = Student.new
  end

  def create
    if @student = Student.create(student_params)
      redirect_to @student, notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Student was successfully destroyed.'
  end

  def index
    @students = Student.all.includes(:student_status)
  end


  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :register_number, :status)
    end
end
