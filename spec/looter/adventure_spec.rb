require 'spec_helper'

describe Adventure do

  it 'holds many rooms' do
    adventure = Adventure.new('Testing rooms', [
      Room.new(:first,  'This is first', nil, nil),
      Room.new(:second, 'Segundo', nil, nil),
      Room.new(:last,   'Last one', nil, nil)
    ])

    adventure.room(:first).name.should == 'This is first'
    adventure.room(:second).name.should == 'Segundo'
    adventure.room(:last).name.should == 'Last one'
  end

  it 'has initial room as the :start room' do
    adventure = Adventure.new('Testing rooms', [
      Room.new(:start, 'This is first', nil, nil),
      Room.new(:last,  'Last one', nil, nil)
    ])

    adventure.next_room.name.should == 'This is first'
  end

end
