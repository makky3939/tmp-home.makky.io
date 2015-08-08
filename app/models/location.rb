class Location < ActiveRecord::Base
  has_many :logs
  
  def self.exist? location_name
    self.find_by name: location_name
  end
end
