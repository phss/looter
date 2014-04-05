
class AdventureLoader
  STARTING_STATE = {
    'current_room' => 'start'
  }

  def self.load_from_hash(configuration_hash, state_hash={})
    state_hash = STARTING_STATE.merge(state_hash)
    rooms = configuration_hash['rooms'].map { |room_hash| RoomLoader.load_from_hash(room_hash) }

    Adventure.new(configuration_hash['title'], rooms, state_hash['current_room'].to_sym)
  end
  
end

class RoomLoader
  
  def self.load_from_hash(configuration_hash)
    room_exits = configuration_hash['directions'].map do |direction|
       Exit.new(direction['room_id'].to_sym, direction['name'])
    end
    Room.new(configuration_hash['id'].to_sym,
             configuration_hash['name'],
             configuration_hash['description'],
             room_exits)
  end

end
