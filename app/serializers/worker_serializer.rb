class WorkerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :price

  def price
    object.salary
  end
end
