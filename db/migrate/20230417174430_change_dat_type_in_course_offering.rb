class ChangeDatTypeInCourseOffering < ActiveRecord::Migration[6.0]
  def change
    change_column(:course_offerings, :min_employees, :integer)
    change_column(:course_offerings, :max_employees, :integer)
  end
end
