require "spec_helper"

describe 'Screens' do
  let(:sample_adventure) { Adventure.new('My great adventure', [
    Room.new(:start, 'First room', 'First description', [
             Exit.new(:one, 'One thing'),
             Exit.new(:another, 'Another')]),
    Room.new(:last,  'Last one', 'Last description', [])
  ], :start)}
  let(:context) { { :adventure => sample_adventure } }

  describe IntroScreen do
    let(:screen) { IntroScreen.new(context) }
    
    it 'layouts title and main menu' do
      screen.layout.should == {
        :title => 'Looter',
        :subtitle => 'My great adventure',
        :options => ['Start new game', 'Continue', 'Exit']
      } 
    end

    it 'has start and exit options' do
      screen.options.should == [:start, :continue, :exit]
    end

    it 'exits as next screen if exit option is chosen' do
      screen.action_for(:exit).should == :exit
    end

    it 'has room as next screen if start option is chosen' do
      screen.action_for(:start).should == :room
    end

  end

  describe RoomScreen do
    let(:screen) { RoomScreen.new(context) }

    it 'layouts room description' do
      screen.layout.should == {
        :title => 'First room',
        :description => 'First description',
        :options => ['One thing', 'Another']
      }
    end

    it 'has exit rooms as screen options' do
      screen.options.should == [:one, :another]
    end
    
    it 'has room as next screen' do
      screen.action_for(:one).should == :room
    end

  end

  describe ExitScreen do
    let(:screen) { ExitScreen.new(context) }

    it 'only layouts bye' do
      screen.layout.should == {
        :description => "Bye!"
      }
    end

    it 'has no options or action_for' do
      screen.options.should be_nil
      screen.action_for(:anything).should be_nil
    end

  end

end
