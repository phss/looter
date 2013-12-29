class Room

  attr_reader :id, :name, :description, :exits

  def initialize(id, name, description, exits)
    @id, @name, @description, @exits = id, name, description, exits
  end

  def self.from_hash(configuration_hash)
    Room.new(configuration_hash['id'].to_sym,
             configuration_hash['name'],
             configuration_hash['description'],
             configuration_hash['directions'].map { |direction| direction['name'] })
  end

end
