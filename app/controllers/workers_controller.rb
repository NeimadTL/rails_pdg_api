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
      render json: { worker: @worker,  message: @message }, status: :created
    else
      render json: { errors: @worker.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @worker = Worker.find(params[:id])
    if @worker.update(worker_params)
      @message = "The worker #{@worker.first_name} was updated successfully"
      render json: { worker: @worker,  message: @message }, status: :ok
    else
      render json: { errors: @worker.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

    def worker_params
      params.require(:worker).permit(:first_name, :status)
    end

end
