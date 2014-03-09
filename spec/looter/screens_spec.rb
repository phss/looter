require "spec_helper"

describe 'Screens' do
  let(:sample_adventure) { Adventure.new('My great adventure', [
    Room.new(:start, 'First room', 'First description', [
             Exit.new(:r1, 'One thing'),
             Exit.new(:r2, 'Another')]),
    Room.new(:last,  'Last one', 'Last description', [])
  ])}

  describe IntroScreen do
    let(:screen) { IntroScreen.new(sample_adventure) }
    
    it 'layouts title and main menu' do
      screen.layout.should == {
        :title => 'Looter',
        :subtitle => 'My great adventure',
        :options => ['Start new game', 'Exit']
      } 
    end

    it 'has start and exit options' do
      screen.options.should == [:start, :exit]
    end

    it 'exits as next screen if exit option is chosen' do
      screen.next_screen(:exit).should == :exit
    end

    it 'has room as next screen if start option is chosen' do
      screen.next_screen(:start).should == :room
    end

  end

  describe RoomScreen do
    let(:screen) { RoomScreen.new(sample_adventure) }

    it 'layouts room description' do
      screen.layout.should == {
        :title => 'First room',
        :description => 'First description',
        :options => ['One thing', 'Another']
      }
    end
    
    it 'has no options or next screen yet' do
      screen.options.should be_nil
      screen.next_screen(:anything).should == :exit
    end

  end

  describe ExitScreen do
    let(:screen) { ExitScreen.new(sample_adventure) }

    it 'only layouts bye' do
      screen.layout.should == {
        :description => "Bye!"
      }
    end

    it 'has no options or next_screen' do
      screen.options.should be_nil
      screen.next_screen(:anything).should be_nil
    end

  end

end
