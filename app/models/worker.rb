class Worker < ApplicationRecord

  validates :first_name, presence: true
  validates :status, presence: true

  has_many :shifts, :foreign_key => :worker_id, class_name: 'Shift'

  def price
    salary
  end

  private

    def fee
      if self.status.eql?('medic')
        270
      elsif self.status.eql?('intern')
        126
      end
    end

    def salary
      salary = 0
      self.shifts.each do |shift|
        if shift.start_date.saturday? || shift.start_date.sunday?
          salary += fee * 2
        else
          salary += fee
        end
      end
      salary
    end

end
