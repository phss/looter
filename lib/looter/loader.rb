
class AdventureLoader

  def self.load_from_hash(configuration_hash)
    rooms = configuration_hash['rooms'].map { |room_hash| RoomLoader.load_from_hash(room_hash) }
    Adventure.new(configuration_hash['title'], rooms)
  end
  
end

class RoomLoader
  
  def self.load_from_hash(configuration_hash)
    Room.new(configuration_hash['id'].to_sym,
             configuration_hash['name'],
             configuration_hash['description'],
             configuration_hash['directions'].map { |direction| direction['name'] })
  end

end
