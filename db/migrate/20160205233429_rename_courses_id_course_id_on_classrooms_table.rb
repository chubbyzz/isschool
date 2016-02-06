class RenameCoursesIdCourseIdOnClassroomsTable < ActiveRecord::Migration
  def up
    rename_column :classrooms, :courses_id,  :course_id
  end
  def down
    rename_column :classrooms, :course_id, :courses_id
  end
end
