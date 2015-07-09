class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :tutor_id
      t.integer :student_id
      t.integer :course_id
      t.datetime :start_time
      t.boolean :urgent, default: false
      t.string  :hangout_link
      t.timestamps null: false
      t.text :note
    end
  end
end
