require 'spec_helper'

describe Game do  
  let(:ui) { double('ui').as_null_object }
  let(:game) { Game.new(ui) }
  let(:sample_adventure) { Adventure.new('My great adventure') }


  describe '(starting)' do

    it 'displays main title' do
      game.play(sample_adventure)

      ui.should have_received(:display_title).with('Looter')
    end

    it 'displays adventure title' do
      game.play(sample_adventure)

      ui.should have_received(:display_subtitle).with('My great adventure')
    end

    it 'displays initial options' do
      game.play(sample_adventure)

      ui.should have_received(:choose_option).with(['Start new game', 'Exit'])
    end

    it 'starts game when new game is choosen' do
      ui.should_receive(:choose_option).and_return(1)

      game.play(sample_adventure)
      
      ui.should have_received(:display_message).with("What's your name, adventurer?")
    end

    it 'exits games when exit is choosen' do
      ui.should_receive(:choose_option).and_return(2)

      game.play(sample_adventure)
      
      ui.should_not have_received(:display_message).with("What's your name, adventurer?")
    end

  end
end
