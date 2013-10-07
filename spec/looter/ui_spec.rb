require 'spec_helper'

describe UI do
  let(:output) { StringIO.new }
  let(:ui) { UI.new(output) }

  it 'displays title' do
    ui.display_title("Some interesting title")

    output.string.should == "# Some interesting title #\n"
  end

  it 'displays subtitle' do
    ui.display_subtitle("Some boring subtitle")

    output.string.should == "- Some boring subtitle -\n"
  end

end
