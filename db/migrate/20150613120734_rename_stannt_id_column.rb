class RenameStanntIdColumn < ActiveRecord::Migration
  def up
    rename_column :classrooms, :studants_id, :students_id
  end
  def down
    rename_column :classrooms, :students_id, :studants_id
  end
end
