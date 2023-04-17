class CreateRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :registrations do |t|
      t.string :employee_email
      t.references :course_offering, null: false, foreign_key: true
      t.string :status
      t.string :registration_id

      t.timestamps
    end
  end
end
