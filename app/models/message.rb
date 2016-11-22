class Message
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  field :type, type: Integer
  field :repeatIndicator, type: Integer
  field :mmsi, type: Integer
  field :receivedDate, type: Time
end
