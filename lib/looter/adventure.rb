class Adventure

  attr_reader :title

  def initialize(title)
    @title = title
  end

  def self.from_hash(configuration_hash)
    Adventure.new(configuration_hash['title'])    
  end

end
