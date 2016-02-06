class RenameCoursesColumn < ActiveRecord::Migration
  def up
    rename_column :classrooms, :coueses_id, :courses_id
  end
  def down
    rename_column :classrooms, :courses_id, :coueses_id
  end
end
