class ShiftsController < ApplicationController

  def index
    @shifts = Shift.order(created_at: :desc)
    render json: @shifts
  end

  def create
    @shift = Shift.new(shift_params)
    if @shift.save
      @message = "The shift on #{@shift.start_date} was created successfully"
      render json: { shift: @shift,  message: @message }, status: :created
    else
      render json: { errors: @shift.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @shift = Shift.find(params[:id])
    if @shift.update(shift_params)
      @message = "The shift on #{@shift.start_date} was updated successfully"
      render json: { shift: @shift,  message: @message }, status: :ok
    else
      render json: { errors: @shift.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

    def shift_params
      params.require(:shift).permit(:start_date, :worker_id)
    end
end
