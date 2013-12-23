class Adventure

  attr_reader :title

  def initialize(title, rooms)
    @title = title
    @rooms = rooms
  end

  def self.from_hash(configuration_hash)
    rooms = configuration_hash['rooms'].map { |room_hash| Room.from_hash(room_hash) }
    Adventure.new(configuration_hash['title'], rooms)
  end

  def room(room_id)
    @rooms.find { |room| room.id == room_id }
  end

  def next_room
    room(:start)
  end

end
