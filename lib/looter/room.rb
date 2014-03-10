class Room

  attr_reader :id, :name, :description

  def initialize(id, name, description, exits)
    @id, @name, @description, @exits = id, name, description, exits
  end

  def exit_names
    @exits.map(&:name)
  end

  def exit_rooms
    @exits.map(&:room_id)
  end

  def has_exit?(room_id)
    exit_rooms.include?(room_id)
  end

end

Exit = Struct.new(:room_id, :name)
