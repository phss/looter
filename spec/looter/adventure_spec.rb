require 'spec_helper'

describe Adventure do

  it 'loads title from configuration hash' do
    adventure = Adventure.from_hash({'title' => 'Title from hash'})

    adventure.title.should == 'Title from hash'
  end
end
