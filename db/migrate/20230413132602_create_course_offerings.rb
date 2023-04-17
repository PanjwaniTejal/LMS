class CreateCourseOfferings < ActiveRecord::Migration[6.0]
  def change
    create_table :course_offerings do |t|
      t.string :name
      t.string :instructor
      t.datetime :date
      t.string :min_employees
      t.string :max_employees
      t.string :course_offering_id

      t.timestamps
    end
  end
end
