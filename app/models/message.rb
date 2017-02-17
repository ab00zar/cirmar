class Message
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :type, type: Integer
  field :repeatIndicator, type: Integer
  field :mmsi, type: String
  field :receivedDate, type: DateTime
  field :shipType, type: Integer

  scope :type, ->(tpe) { where(message_type: tpe) }
  scope :navire, ->(value) { where(shipType: value) }
  scope :ship, ->{select("mmsi").distinct}

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

def self.today
  map = %Q{
    function() {
      emit(this.mmsi, {count: 1})
    }
  }

  reduce = %Q{
    function(key, values) {
      var result = {count: 0};
      values.forEach(function(value) {
        result.count += value.count;
      });
      return result;
    }
  }

  self.map_reduce(map, reduce).out(inline: true)
end


end
