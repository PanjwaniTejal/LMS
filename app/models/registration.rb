class Registration < ApplicationRecord
  belongs_to :course_offering

  validates :employee_email, :registration_id, uniqueness: true
  validate :registration_id_validation, on: :create


  before_create :generate_registration_id, :add_status
  after_create_commit :check_course_status

  # Cancel registation
  def cancel_course_registration
    self.status = if self.course_offering.status == 'COURSE_FULL_ERROR'
                    'CANCEL_REJECTED'
                  else
                    'CANCEL_ACCEPTED'
                  end
        
    self.save!
  end

  private

  # Validation for registration_id should be uniq
  def registration_id_validation
    rid = "REG-COURSE-#{employee_name.upcase}-#{course_offering.name.upcase}"
    if Registration.find_by(registration_id: rid).present?
      self.errors[:base] << "Combination of employee_name and course_offering name should be uniq"
    end
  end

  # Generate registration_id
  def generate_registration_id
    self.registration_id = "REG-COURSE-#{employee_name.upcase}-#{course_offering.name.upcase}"
  end

  # Get employee name form email id
  def employee_name
    employee_email.split('@').first
  end


  # course_offerings status change
  def add_status
    self
      .course_offering
      .status = if course_offering.registrations.count > course_offering.max_employees
                    'COURSE_FULL_ERROR'
                  elsif course_offering.date > Date.today || course_offering.registrations.count < course_offering.min_employees
                   'COURSE_CANCELED'
                  else
                    'ACCEPTED'
                  end

    self.course_offering.save
  end
 

  def check_course_status
    course_offering.reload
    if course_offering.date < Date.today || course_offering.registrations.count < course_offering.min_employees
      course_offering.update(status: 'CANCELED')
    end
  end
end
