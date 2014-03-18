require 'spec_helper'
require 'YAML'

describe SaveGame do

  it 'saves current room from adventure' do
    adventure = Adventure.new('Testing rooms', [
      Room.new(:start, 'First', nil, [ Exit.new(:left, "Left"), Exit.new(:right, "Right") ]),
      Room.new(:left, 'Left', nil, [ Exit.new(:another, "Another") ]),
      Room.new(:right, 'Right', nil, [ Exit.new(:no_way, "No way") ]),
      Room.new(:another, 'Final destination', nil, [])
    ])
    adventure.travel_to(:right)

    saver = SaveGame.new('/tmp/save_file.yaml')
    saver.save(adventure)

    YAML.load_file('/tmp/save_file.yaml').should == { 'current_room' => :right }
  end

end
