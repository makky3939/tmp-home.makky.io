json.array!(@logs) do |log|
  json.extract! log, :id, 'created_at', 'updated_at'
  json.atmosphere log.atmosphere, :id, :value
  json.humidity log.humidity, :id, :value
  json.temperature log.temperature, :id, :value
  json.location log.location, :id, :name
end