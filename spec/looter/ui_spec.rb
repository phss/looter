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

  it 'displays a message' do
    ui.display_message('Some message')

    output.string.should == "Some message\n"
  end

  describe '(choosing an option)' do
    let(:options) { [:first, :second, :third] }

    it 'chooses an option by its number' do
      input.string = '1'
      ui.choose_option(options).should == :first

      input.string = '2'
      ui.choose_option(options).should == :second

      input.string = '3'
      ui.choose_option(options).should == :third
    end

    it 'returns nil when choosen option is out of range' do
      input.string = '0'
      ui.choose_option(options).should == nil

      input.string = '4'
      ui.choose_option(options).should == nil
    end
  end

end
