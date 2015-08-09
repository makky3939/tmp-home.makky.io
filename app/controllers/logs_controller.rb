class LogsController < ApplicationController
  def index
    @logs = Log.all
  end
  
  def show
    @log = Log.find_by id: log_params[:id]
  end
  
  private
  def log_params
    params.permit :id
  end
end
