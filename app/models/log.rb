class Log < ActiveRecord::Base
  has_one :atmosphere
  has_one :humidity
  has_one :temperature
  belongs_to :location
  
  default_scope { includes(:temperature, :humidity, :atmosphere, :location) }
end
