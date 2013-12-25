require 'spec_helper'

describe 'Templates' do

  describe SingleValueTemplate do
    
    it 'applies template to single value' do
      template = SingleValueTemplate.new("This is '%s' the thing")

      template.apply('blah').should == "This is 'blah' the thing"
    end

  end

end
