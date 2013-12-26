require 'spec_helper'

describe Room do

  it 'loads from configuration hash' do
    room = Room.from_hash({ 'id' => 'eyedee', 
                            'name' => 'Roomy',
                            'description' => 'Exciting scenary' })

    room.id.should == :eyedee
    room.name.should == 'Roomy'
    room.description.should == 'Exciting scenary'
  end

end
