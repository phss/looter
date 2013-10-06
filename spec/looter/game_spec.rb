require 'spec_helper'

describe Game do  
  let(:ui) { double('ui').as_null_object }
  let(:game) { Game.new(ui) }
  let(:sample_adventure) { double('adventure', :title => 'My great adventure') }


  describe '(starting)' do

    it 'displays main title' do
      game.play(sample_adventure)

      ui.should have_received(:display_title).with('Looter')
    end

    it 'displays adventure title' do
      game.play(sample_adventure)

      ui.should have_received(:display_subtitle).with('My great adventure')
    end

  end
end
