class Worker < ApplicationRecord

  validates :first_name, presence: true
  validates :status, presence: true

  has_many :shifts, :foreign_key => :worker_id, class_name: 'Shift'

  def salary
    SalaryCalculator.instance.salary(self)
  end

end
