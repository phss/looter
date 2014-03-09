class Adventure

  attr_reader :title

  def initialize(title, rooms)
    @title = title
    @rooms = rooms
  end

  def room(room_id)
    @rooms.find { |room| room.id == room_id }
  end

  def next_room
    room(:start)
  end

end
