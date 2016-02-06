class Course < ActiveRecord::Base
  validates :name, length: {in: 3..45}
  validates :description, length: {in: 3..45}
  validates :status, inclusion: {in: 1..2, message: 'Status must be in Active or inactive.'}

  has_many :classrooms
  has_many :students, through: :classrooms
  belongs_to :course_status, foreign_key: :status, class_name: 'Status'
end
