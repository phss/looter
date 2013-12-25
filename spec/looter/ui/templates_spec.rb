require 'spec_helper'

describe 'Templates' do

  describe SingleValueTemplate do

    it 'applies template to single value' do
      template = SingleValueTemplate.new("This is '%s' the thing")

      template.apply('blah').should == "This is 'blah' the thing"
    end

  end

  describe ListTemplate do

    it 'generates a numbered list, applying the template to the values' do
      template = ListTemplate.new(") <%s>")

      template.apply(['One', 'Two', 'Three']).should == "1) <One>\n2) <Two>\n3) <Three>"
    end

  end

end
