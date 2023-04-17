class CourseOffering < ApplicationRecord
  has_many :registrations
  validates :name, :instructor, :date, :min_employees, :max_employees, presence: true
  validate :course_offering_id_validation

  before_create :generate_course_offering_id

  private

  # Validation for course_offering_id should be uniq
  def course_offering_id_validation
    coid = "OFFERING-#{name.upcase}-#{instructor.upcase}"
    if CourseOffering.find_by(course_offering_id: coid).present?
      self.errors[:base] << "Combination of name and instructor should be uniq"
    end
  end

  # Generate course_offering_id
  def generate_course_offering_id
    self.course_offering_id = "OFFERING-#{name.upcase}-#{instructor.upcase}"
  end
end
