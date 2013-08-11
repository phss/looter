require 'sinatra'

class LooterApp < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/start' do
    erb :start    
  end

  post '/start' do
    session[:game_id] = settings.adventure.new
    
    redirect '/room'
  end

  get '/room' do
    'Nothing yet'
  end

end
