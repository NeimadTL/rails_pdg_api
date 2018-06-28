class WorkersController < ApplicationController

  def index
    @workers = Worker.all
    render json: {
      workers: ActiveModel::ArraySerializer.new(@workers, each_serializer: WorkerSerializer),
      commission: CommissionCalculator.new
    }
  end

end
