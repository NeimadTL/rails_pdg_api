class ShiftSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :worker_firstname, :worker_id

  def worker_firstname
    object.worker.nil? ? 'no body' : object.worker.first_name
  end

  def worker_id
    object.worker.id unless object.worker.nil?
  end
end
