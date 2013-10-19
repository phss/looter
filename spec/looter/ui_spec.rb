require 'spec_helper'

describe UI do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:ui) { UI.new(input, output) }

  it 'displays title' do
    ui.display_title("Some interesting title")

    output.string.should == "# Some interesting title #\n"
  end

  it 'displays subtitle' do
    ui.display_subtitle("Some boring subtitle")

    output.string.should == "- Some boring subtitle -\n"
  end

  it 'displays options' do
    ui.choose_option(['First', 'Second', 'Third'])

    output.string.should == "1- First\n2- Second\n3- Third\n"
  end

  it 'chooses an option' do
    input << 'Second'
    
    choosen_option = ui.choosen_option(['First', 'Second', 'Third'])

    expect(choosen_option).should == 1
  end

  it 'displays a message' do
    ui.display_message('Some message')

    output.string.should == "Some message\n"
  end

end
