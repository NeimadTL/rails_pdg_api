class SalaryCalculator
  include Singleton

  MEDIC_FEE = 270
  INTERN_FEE = 126

  def salary(worker)
    salary, status = 0, worker.status
    worker.shifts.each do |shift|
      salary += shift.on_weekend? ? double_fee(status) : fee(status)
    end
    salary
  end

  private

    def fee(status)
      if status.eql?('medic')
        MEDIC_FEE
      elsif status.eql?('intern')
        INTERN_FEE
      end
    end

    def double_fee(status)
      fee(status) * 2
    end

end
