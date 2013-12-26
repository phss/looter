require 'spec_helper'

describe Adventure do

  it 'holds many rooms' do
    adventure = Adventure.new('Testing rooms', [
      Room.new(:first,  'This is first', nil),
      Room.new(:second, 'Segundo', nil),
      Room.new(:last,   'Last one', nil)
    ])

    adventure.room(:first).name.should == 'This is first'
    adventure.room(:second).name.should == 'Segundo'
    adventure.room(:last).name.should == 'Last one'
  end

  it 'has initial room as the :start room' do
    adventure = Adventure.new('Testing rooms', [
      Room.new(:start, 'This is first', nil),
      Room.new(:last,  'Last one', nil)
    ])

    adventure.next_room.name.should == 'This is first'
  end

  it 'loads from configuration hash' do
    adventure = Adventure.from_hash({
      'title' => 'Title from hash',
      'rooms' => [
        { 'id' => 'start',   'name' => 'First room' },
        { 'id' => 'another', 'name' => 'Another room' }
      ]
    })

    adventure.title.should == 'Title from hash'
    adventure.room(:start).name.should == 'First room'
    adventure.room(:another).name.should == 'Another room'
  end
end
