class AddFiledInToCourseOffering < ActiveRecord::Migration[6.0]
  def change
    add_column(:course_offerings, :status, :string)
  end
end
