require 'spec_helper'

describe Game do  
  let(:ui) { double() }

  it 'displays game title when starting the game' do
    ui.should_receive(:display_title).with('My great adventure')

    game = Game.new(ui, 'My great adventure')

    game.play
  end
end
