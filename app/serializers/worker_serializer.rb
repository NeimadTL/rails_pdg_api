class WorkerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :status, :price, :shifts_count, :shifts_dates

  def price
    object.salary
  end

  def shifts_count
    object.shifts.count
  end

  def shifts_dates
    object.shifts.map { |shift| shift.start_date }
  end
end
