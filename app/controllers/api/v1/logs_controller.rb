class Api::V1::LogsController < ApplicationController
  protect_from_forgery except: :create

  before_filter {
    digest_authentication unless Rails.env.test? or Rails.env.development?
  }

  def index
    targets = Log.group('location_id').maximum('created_at').values
    @logs = Log.where(created_at: targets).order('id')

    render layout: false
  end

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

  def digest_authentication
    authenticate_or_request_with_http_basic do |name, password|
      device = Device.find_by name: name
      device.authoricate name, password
    end
  end
end
