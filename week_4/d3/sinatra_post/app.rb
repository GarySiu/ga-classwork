require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'

get '/' do
  @title = 'Home'
  erb :home
end

post '/navigate' do
  # binding.pry
  case params['destination'].downcase
    when 'sports' then redirect to '/sports'
    when 'weather' then redirect to '/weather'
    when 'gossip' then redirect to '/gossip'
    when 'celebrity' then redirect to '/celebrity'
    else
      @error = 'Invalid page selected you moron!'
      erb :home
  end

end

get '/sports' do
  @title = 'Sports'
  erb :sports
end

get '/weather' do
  @title = 'Weather'
  erb :weather
end

get '/gossip' do
  @title = 'Gossip'
  erb :gossip
end

get '/celebrity' do
  @title = 'Celebrity'
  erb :celebrity
end