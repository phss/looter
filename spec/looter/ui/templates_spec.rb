require 'spec_helper'

describe 'Templates' do

  describe SingleValueTemplate do

    it 'applies template to single value' do
      template = SingleValueTemplate.new("This is '%s' the thing")

      template.apply('blah').should == "This is 'blah' the thing"
    end

  end

  describe ListTemplate do

    it 'applies template to a list of values' do
      template = ListTemplate.new("%s")

      template.apply(['First value', 'Second value']).should == "First value\nSecond value"
    end

  end

end
