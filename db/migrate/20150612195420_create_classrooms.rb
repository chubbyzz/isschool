class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.integer :studants_id
      t.integer :coueses_id
      t.datetime :entry_at

      t.timestamps null: false
    end
  end
end
