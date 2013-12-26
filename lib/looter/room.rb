class Room

  attr_reader :id, :name, :description

  def initialize(id, name, description)
    @id, @name, @description = id, name, description
  end

  def self.from_hash(configuration_hash)
    Room.new(configuration_hash['id'].to_sym,
             configuration_hash['name'],
             configuration_hash['description'])
  end

end
