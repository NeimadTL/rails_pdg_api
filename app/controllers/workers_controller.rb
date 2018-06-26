class WorkersController < ApplicationController

  def index
    @workers = Worker.all
    render json: @workers
  end

end
