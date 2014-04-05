require 'spec_helper'

describe Adventure do

  it 'holds many rooms' do
    adventure = Adventure.new('Testing rooms', [
      Room.new(:first,  'This is first', nil, nil),
      Room.new(:second, 'Segundo', nil, nil),
      Room.new(:last,   'Last one', nil, nil)
    ], :first)

    adventure.room(:first).name.should == 'This is first'
    adventure.room(:second).name.should == 'Segundo'
    adventure.room(:last).name.should == 'Last one'
  end

  it 'has initial room as to whatever room is supplied as start room' do
    adventure = Adventure.new('Testing rooms', [
      Room.new(:first, 'This is first', nil, nil),
      Room.new(:last,  'Last one', nil, nil)
    ], :first)

    adventure.current_room.name.should == 'This is first'
  end

  describe "(traveling)" do
    let(:adventure) do
      Adventure.new('Testing rooms', [
        Room.new(:start, 'First', nil, [ Exit.new(:left, "Left"), Exit.new(:right, "Right") ]),
        Room.new(:left, 'Left', nil, [ Exit.new(:another, "Another") ]),
        Room.new(:right, 'Right', nil, [ Exit.new(:no_way, "No way") ]),
        Room.new(:another, 'Final destination', nil, [])
      ], :start)
    end

    it 'travels through rooms using room ids' do
      adventure.travel_to(:left)
      adventure.travel_to(:another)

      adventure.current_room.name.should == 'Final destination'
    end

    it 'cannot travel to room not accessible through current room' do
      expect { adventure.travel_to(:another) }.should raise_error(LooterInvalidRoute)
    end

  end

end
