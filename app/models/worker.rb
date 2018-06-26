class Worker < ApplicationRecord

  validates :first_name, presence: true
  validates :status, presence: true

  has_many :shifts, :foreign_key => :worker_id, class_name: 'Shift'

  def price
    if self.status.eql?('medic')
      self.shifts.count * 270
    elsif self.status.eql?('intern')
      self.shifts.count * 126
    end
  end

end
