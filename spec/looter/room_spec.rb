require 'spec_helper'

describe Room do

  it 'loads from configuration hash' do
    room = Room.from_hash({ 'id' => 'eyedee', 'name' => 'Roomy' })

    room.id.should == :eyedee
    room.name.should == 'Roomy'
  end

end
