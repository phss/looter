require 'spec_helper'
require 'YAML'

describe GamePersistence do
  let(:adventure) do
    Adventure.new('Testing rooms', [
      Room.new(:start, 'First', nil, [ Exit.new(:left, "Left"), Exit.new(:right, "Right") ]),
      Room.new(:left, 'Left', nil, [ Exit.new(:another, "Another") ]),
      Room.new(:right, 'Right', nil, [ Exit.new(:no_way, "No way") ]),
      Room.new(:another, 'Final destination', nil, [])
    ], :start)
  end

  it 'saves current room from adventure' do
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
    pending
    save = { "current_room" => :another }
    File.open("/tmp/save_file.yaml", 'w') { |f| f.write(save.to_yaml) }

    persistence = GamePersistence.new('/tmp/save_file.yaml')
    persistence.load(adventure)

    adventure.current_room.id.should == :another
  end

end
