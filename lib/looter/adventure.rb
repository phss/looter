class Adventure

  attr_reader :title, :current_room

  def initialize(title, rooms)
    @title = title
    @rooms = rooms
    @current_room = room(:start)
  end

  def room(room_id)
    @rooms.find { |room| room.id == room_id }
  end

  def travel_to(room_id)
    raise LooterInvalidRoute unless current_room.has_exit?(room_id)
    @current_room = room(room_id)
  end

end

class LooterInvalidRoute < StandardError; end
