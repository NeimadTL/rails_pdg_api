class Worker < ApplicationRecord

  validates :first_name, presence: true
  validates :price_per_shift, numericality: { only_integer: true }

  has_many :shifts, :foreign_key => :worker_id, class_name: 'Shift'

  def price
    self.shifts.count * self.price_per_shift
  end

end
