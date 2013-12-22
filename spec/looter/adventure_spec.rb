require 'spec_helper'

describe Adventure do

  it 'holds many rooms' do
    adventure = Adventure.new('Testing rooms', [
      Room.new(:first,  'This is first'),
      Room.new(:second, 'Segundo'),
      Room.new(:last,   'Last one'),
    ])

    adventure.room(:first).name.should == 'This is first'
    adventure.room(:second).name.should == 'Segundo'
    adventure.room(:last).name.should == 'Last one'
  end

  it 'loads title from configuration hash' do
    adventure = Adventure.from_hash({'title' => 'Title from hash'})

    adventure.title.should == 'Title from hash'
  end
end
