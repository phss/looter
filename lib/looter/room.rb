class Room

  attr_reader :id, :name, :description, :exits

  def initialize(id, name, description, exits)
    @id, @name, @description, @exits = id, name, description, exits
  end

end
