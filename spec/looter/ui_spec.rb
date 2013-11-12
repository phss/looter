require 'spec_helper'

describe UI do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:ui) { UI.new(input, output) }

  it 'displays screen' do
    ui.display_screen(
      :title => 'My title',
      :subtitle => 'Your subtitle',
      :options => ['One', 'Two'])

    output.string.should == "# My title #\n- Your subtitle -\n1- One\n2- Two\n"
  end

  it 'chooses an option by its number' do
    input.string = '1'
    
    choosen_option = ui.choose_option([:first, :second, :third])

    choosen_option.should == :first
  end

  it 'displays a message' do
    ui.display_message('Some message')

    output.string.should == "Some message\n"
  end

end
