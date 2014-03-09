require 'spec_helper'

describe AdventureLoader do

  it 'loads from configuration hash' do
    adventure = AdventureLoader.load_from_hash({
      'title' => 'Title from hash',
      'rooms' => [
        { 'id' => 'start',   'name' => 'First room', 'directions' => [] },
        { 'id' => 'another', 'name' => 'Another room', 'directions' => [] }
      ]
    })

    adventure.title.should == 'Title from hash'
    adventure.room(:start).name.should == 'First room'
    adventure.room(:another).name.should == 'Another room'
  end

end

describe RoomLoader do

  it 'loads from configuration hash' do
    pending
    room = RoomLoader.load_from_hash({ 'id' => 'eyedee', 
                            'name' => 'Roomy',
                            'description' => 'Exciting scenary',
                            'directions' => [
                              { 'name' => 'One way', 'room_id' => 'oneway' },
                              { 'name' => 'Another', 'room_id' => 'another' }
                            ]})

    room.id.should == :eyedee
    room.name.should == 'Roomy'
    room.description.should == 'Exciting scenary'
    room.exit_names.should == ['One way', 'Another']
    room.exit_rooms.should == ['oneway',  'another']
  end

end
