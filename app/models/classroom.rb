class Classroom < ActiveRecord::Base
  after_initialize :init

  validates :course_id, presence: true
  validates :student_id, presence: true
  validate :course_and_student_should_not_be_duplicate

  belongs_to :course, foreign_key: :course_id
  belongs_to :student, foreign_key: :student_id


  def init
    self.entry_at = DateTime.now;
  end

  def course_and_student_should_not_be_duplicate
    if Classroom.where(:course_id => self.course_id).where(:student_id => self.student_id).any?
      errors.add(:student, ' is already in this course')
    end
  end
end
