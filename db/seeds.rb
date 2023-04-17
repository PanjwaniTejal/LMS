# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

course_offering = CourseOffering.create!(name: 'test123', instructor: 'test123', date: (Date.today+2), max_employees: 20, min_employees: 5)
Registration.create(employee_email: 'tejal@gmail.com', course_offering_id: course_offering.id)
