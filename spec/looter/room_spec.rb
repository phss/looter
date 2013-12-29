require 'spec_helper'

describe Room do

  it 'loads from configuration hash' do
    room = Room.from_hash({ 'id' => 'eyedee', 
                            'name' => 'Roomy',
                            'description' => 'Exciting scenary',
                            'directions' => [
                              { 'name' => 'One way', 'room_id' => 'oneway' },
                              { 'name' => 'Another', 'room_id' => 'another' }
                            ]})

    room.id.should == :eyedee
    room.name.should == 'Roomy'
    room.description.should == 'Exciting scenary'
    room.exits.should == ['One way', 'Another']
  end

end
