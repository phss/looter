require 'spec_helper'

describe AdventureLoader do
  let(:adventure_hash) do
    {
      'title' => 'Title from hash',
      'rooms' => [
        { 'id' => 'start',   'name' => 'First room', 'directions' => [] },
        { 'id' => 'another', 'name' => 'Another room', 'directions' => [] }
      ]
    }
  end

  it 'loads from configuration hash defaulting current room to start when no state hash' do
    adventure = AdventureLoader.load_from_hash(adventure_hash)

    adventure.title.should == 'Title from hash'
    adventure.room(:start).name.should == 'First room'
    adventure.room(:another).name.should == 'Another room'
    adventure.current_room.name.should == 'First room'
  end

end

describe RoomLoader do

  it 'loads from configuration hash' do
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
    room.exit_rooms.should == [:oneway,  :another]
  end

end
