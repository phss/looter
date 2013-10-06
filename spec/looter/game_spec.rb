require 'spec_helper'

describe Game do  
  let(:ui) { double('ui', :display_title => true) }
  let(:game) { Game.new(ui) }

  it 'displays main title when starting the game' do
    game.play

    ui.should have_received(:display_title).with('Looter')
  end
end
