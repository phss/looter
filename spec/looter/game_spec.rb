require 'spec_helper'

describe Game do
  let(:ui) { double('ui').as_null_object }
  let(:game) { Game.new(ui) }
  let(:sample_adventure) { Adventure.new('My great adventure') }


  describe '(intro)' do

    it 'displays titles and main menu' do
      game.play(sample_adventure)

      ui.should have_received(:display_screen).with({
        :title => 'Looter',
        :subtitle => 'My great adventure',
        :options => ['Start new game', 'Exit']
      })
    end

  end

  describe '(main menu)' do

    it 'starts game when new game is choosen' do
      ui.should_receive(:choose_option).and_return(:start)

      game.play(sample_adventure)

      ui.should have_received(:display_message).with("What's your name, adventurer?")
    end

    it 'exits games when exit is choosen' do
      ui.should_receive(:choose_option).and_return(:exit)

      game.play(sample_adventure)

      ui.should have_received(:display_message).with("Bye!")
    end

  end
end
