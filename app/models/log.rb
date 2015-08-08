class Log < ActiveRecord::Base
  has_one :atmosphere, class_name: 'atmosphere', foreign_key: 'atmosphere_id'
  has_one :humidity, class_name: 'humidity', foreign_key: 'humidity_id'
  has_one :temperature, class_name: 'temperature', foreign_key: 'temperature_id'
  belongs_to :location
end
