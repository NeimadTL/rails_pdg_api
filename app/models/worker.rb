class Worker < ApplicationRecord

  MEDIC_STATUS = 'medic'
  INTERN_STATUS = 'intern'
  COVER_STATUS = 'cover'

  validates :first_name, presence: true
  validates :status, presence: true, inclusion: { in: [MEDIC_STATUS, INTERN_STATUS, COVER_STATUS] }

  has_many :shifts, :foreign_key => :worker_id, class_name: 'Shift'

  def salary
    SalaryCalculator.instance.salary(self)
  end

end
