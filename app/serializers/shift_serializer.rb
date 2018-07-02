class ShiftSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :worker

  def worker
    object.worker.nil? ? 'no body' : object.worker.first_name 
  end
end
