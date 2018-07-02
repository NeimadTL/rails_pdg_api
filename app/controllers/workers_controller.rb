class WorkersController < ApplicationController

  def index
    @workers = Worker.order(created_at: :desc)
    render json: {
      workers: ActiveModel::ArraySerializer.new(@workers, each_serializer: WorkerSerializer),
      commission: CommissionCalculator.new
    }
  end


  def create
    @worker = Worker.new(worker_params)
    if @worker.save
      @message = "The worker #{@worker.first_name} was created successfully"
      render json: { user: @worker,  message: @message }, status: :created
    else
      render json: @worker.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

    def worker_params
      params.require(:worker).permit(:first_name, :status)
    end

end
