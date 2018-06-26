class Worker < ApplicationRecord

  validates :first_name, presence: true
  validates :price_per_shift, numericality: { only_integer: true }

  has_many :shifts, :foreign_key => :worker_id, class_name: 'Shift'

end
