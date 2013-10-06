require 'spec_helper'

describe Game do  
  let(:ui) { double('ui').as_null_object }
  let(:game) { Game.new(ui) }
  let(:sample_adventure) { double('adventure', :title => 'My great adventure') }

  it 'displays main title when starting the game' do
    game.play(sample_adventure)

    ui.should have_received(:display_title).with('Looter')
  end

  it 'displays adventure title when starting the game' do
    game.play(sample_adventure)

    ui.should have_received(:display_subtitle).with('My great adventure')
  end
end
