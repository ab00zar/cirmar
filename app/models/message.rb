class Message
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :type, type: Integer
  field :repeatIndicator, type: Integer
  field :mmsi, type: Integer
  field :receivedDate, type: Date
  field :shipType, type: Integer

  scope :type, ->(tpe) { where(type: tpe) }
  scope :navire, ->(value) { where(shipType: value) }

  def self.to_csv()
      #all = Message.type(opt)
      column_names = ['type', 'repeatIndicator', 'mmsi']
       CSV.generate do |csv|
            csv << column_names
            all.each do |message|
                    csv << message.attributes.values_at(*column_names)
            end
       end
  end
end
