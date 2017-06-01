json.extract! message, :id, :type, :repeatIndicator, :mmsi, :receivedDate, :created_at, :updated_at
json.url message_url(message, format: :json)