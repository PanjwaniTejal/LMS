# 1
# CourseOffering: ADD-COURSE-OFFERING DATASCIENCE BOB 05062022 1 3
CourseOffering.create(name: 'DATASCIENCE', instructor: 'BOB', date: (Date.today+5), min_employees: 1, max_employees: 3)

# REGISTER: WOO@GMAIL.COM OFFERING-DATASCIENCE-BOB
Registration.create(employee_email: 'WOO@GMAIL.COM', course_offering: CourseOffering.find_by(course_offering_id: "OFFERING-DATASCIENCE-BOB"))
# REGISTER: ANDY@GMAIL.COM OFFERING-DATASCIENCE-BOB
Registration.create(employee_email: 'ANDY@GMAIL.COM', course_offering: CourseOffering.find_by(course_offering_id: "OFFERING-DATASCIENCE-BOB"))

# Allot: OFFERING-DATASCIENCE-BOB
course_offering = CourseOffering.find_by(course_offering_id: 'OFFERING-DATASCIENCE-BOB').allot
course_offering.active_registrations


# 2
# CourseOffering: ADD-COURSE-OFFERING PYTHON JOHN 05062022 1 3
CourseOffering.create(name: 'PYTHON', instructor: 'JOHN', date: (Date.today+2), min_employees: 1, max_employees: 3)

# REGISTER: WOO@GMAIL.COM OFFERING-PYTHON-JOHN
Registration.create(employee_email: 'WOO@GMAIL.COM', course_offering: CourseOffering.find_by(course_offering_id: "OFFERING-PYTHON-JOHN"))

# REGISTER: ANDY@GMAIL.COM OFFERING-PYTHON-JOHN
Registration.create(employee_email: 'ANDY@GMAIL.COM', course_offering: CourseOffering.find_by(course_offering_id: "OFFERING-PYTHON-JOHN"))


# REGISTER: BOBY@GMAIL.COM OFFERING-PYTHON-JOHN
boby_register = Registration.create(employee_email: 'BOBY@GMAIL.COM', course_offering: CourseOffering.find_by(course_offering_id: "OFFERING-PYTHON-JOHN"))

# CANCEL: REG-COURSE-BOBY-PYTHON
boby_register.cancel_course_registration # CANCEL_ACCEPTED

# ALLOT: OFFERING-PYTHON-JOHN
course_offering = CourseOffering.find_by(course_offering_id: 'OFFERING-PYTHON-JOHN').allot
course_offering.active_registrations
