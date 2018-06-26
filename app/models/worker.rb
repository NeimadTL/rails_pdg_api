class Worker < ApplicationRecord

  validates :first_name, presence: true
  validates :price_per_shift, numericality: { only_integer: true }
end
