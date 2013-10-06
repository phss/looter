require 'spec_helper'

describe Game do  
  let(:ui) { double() }

  it 'displays main title when starting the game' do
    ui.should_receive(:display_title).with('Looter')

    game = Game.new(ui)

    game.play
  end
end
