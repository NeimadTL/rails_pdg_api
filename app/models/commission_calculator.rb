class CommissionCalculator

  FEE_PER_COVER_SHIFT = 80
  PERCENT_PER_SHIFT = 0.05

  attr_reader :cover_shifts, :pdg_fee

  def initialize
    @cover_shifts = Worker.where(status: 'cover').sum { |worker| worker.shifts.count }
    salaries_sum = Worker.all.sum { |worker| worker.salary }
    @pdg_fee = (PERCENT_PER_SHIFT * salaries_sum) + (FEE_PER_COVER_SHIFT * @cover_shifts)
  end

end
