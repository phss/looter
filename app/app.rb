require 'sinatra'

class LooterApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/start' do
    erb :start    
  end

  post '/start' do
  end

end
