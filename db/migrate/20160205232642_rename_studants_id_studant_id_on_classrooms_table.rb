class RenameStudantsIdStudantIdOnClassroomsTable < ActiveRecord::Migration
  def up
    rename_column :classrooms, :students_id,  :student_id
  end
  def down
    rename_column :classrooms, :student_id, :students_id
  end
end
