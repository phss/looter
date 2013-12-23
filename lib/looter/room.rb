class Room

  attr_reader :id, :name

  def initialize(id, name)
    @id, @name = id, name
  end

  def self.from_hash(configuration_hash)
    Room.new(configuration_hash['id'].to_sym,
             configuration_hash['name'])
  end

end
