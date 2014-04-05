require 'spec_helper'
require 'YAML'

describe GamePersistence do

  it 'saves current room from adventure' do
    adventure = Adventure.new('Testing rooms', [
      Room.new(:start, 'First', nil, [ Exit.new(:left, "Left"), Exit.new(:right, "Right") ]),
      Room.new(:left, 'Left', nil, [ Exit.new(:another, "Another") ]),
      Room.new(:right, 'Right', nil, [ Exit.new(:no_way, "No way") ]),
      Room.new(:another, 'Final destination', nil, [])
    ], :start)
    adventure.travel_to(:right)

    persistence = GamePersistence.new('games', '/tmp', 'save_file.yaml')
    persistence.save(adventure)

    YAML.load_file('/tmp/save_file.yaml').should == { 'current_room' => 'right' }
  end

  it 'creates new adventure' do
    persistence = GamePersistence.new('games', '/tmp', 'adventure_cave.yaml')

    adventure = persistence.new_adventure

    adventure.current_room.name.should == "Entrance"
  end

  it 'loads current adventure from save game' do
    save = { "current_room" => 'room6' }
    File.open("/tmp/adventure_cave.yaml", 'w') { |f| f.write(save.to_yaml) }

    persistence = GamePersistence.new('games', '/tmp', 'adventure_cave.yaml')
    adventure = persistence.load

    adventure.current_room.id.should == :room6
  end

end
