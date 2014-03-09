require 'spec_helper'

describe Game do
  let(:ui) { double('ui').as_null_object }
  let(:screens) { { :first => FirstScreen, :last => LastScreen } }
    
  it 'interacts with single screen in final screen' do
    game = Game.new(ui, screens, :last)

    game.play(double('adventure'))

    ui.should have_received(:display_screen).with(:title => "Last", 
                                                  :description => "Last screen")
    ui.should have_received(:choose_option).with([:something, :another])
  end

  it 'navigates to next screen when still playing' do
    game = Game.new(ui, screens, :first)
    ui.should_receive(:choose_option).and_return(:last)

    game.play(double('adventure'))

    ui.should have_received(:display_screen).with(:title => "First", 
                                                  :description => "First screen")
    ui.should have_received(:display_screen).with(:title => "Last", 
                                                  :description => "Last screen")
  end

end

class FirstScreen < Screen
  def layout
    { :title => "First", :description => "First screen" }
  end

  def options
    [:last, :never]
  end

  def next_screen(option)
    option
  end
end

class LastScreen < Screen
  def layout
    { :title => "Last", :description => "Last screen" }
  end

  def options
    [:something, :another]
  end

  def next_screen(option)
    nil
  end
end
