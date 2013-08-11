require 'spec_helper'

describe 'Looter' do
  let(:adventure) { double('adventure') }

  def app
    app = LooterApp.new
    app.settings.set :adventure, adventure
    return app
  end

  describe '(POST /start)' do
    it 'should start new adventure' do
      adventure.should_receive(:new).and_return(345)

      post '/start'

      last_response.should be_redirect
      last_response.location.should include '/room' 
      last_request.env['rack.session'][:game_id].should == 345
    end
  end

end
