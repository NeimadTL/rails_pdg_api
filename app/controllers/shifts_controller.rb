class ShiftsController < ApplicationController

  before_action :set_shift, :only => [:update, :destroy]

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
    if @shift.update(shift_params)
      @message = "The shift on #{@shift.start_date} was updated successfully"
      render json: { shift: @shift,  message: @message }, status: :ok
    else
      render json: { errors: @shift.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @shift.destroy
    @message = "The shift on #{@shift.start_date} was deleted successfully"
    render json: { shift: @shift,  message: @message }, status: :ok
  end

  private

    def shift_params
      params.require(:shift).permit(:start_date, :worker_id)
    end

    def set_shift
      @shift = Shift.find(params[:id])
    end
end
