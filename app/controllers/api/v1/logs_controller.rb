class Api::V1::LogsController < ApplicationController
  def create
    location = Location.exist? log_params[:location]

    if location.nil?
      location = Location.create name: log_params[:location]
    end
    
    log = Log.new location: location
    
    atmosphere = Atmosphere.create value: log_params[:atmosphere]
    humidity = Humidity.create value: log_params[:humidity]
    temperature = Temperature.create value: log_params[:temperature]
    
    log.atmosphere = atmosphere
    log.humidity = humidity
    log.temperature = temperature

     if log.save
      render json: {}
    else
      render json: {}
    end
  end
  
  private
  def log_params
    params.permit :location, :atmosphere, :humidity, :temperature
  end
end
