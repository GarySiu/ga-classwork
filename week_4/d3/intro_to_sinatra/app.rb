require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'

get '/' do
  @header = 'This is totally not php'
  @data = {
    name: 'citygent',
    age: 48,
    hobbies: ['Cycling',
              'talking about bikes', 
              'eating bikes', 
              'burning bikes']
  }
  erb :home
end

get '/hi/:name' do
  # binding.pry
  "I am Sinatra and I am saying hi to #{params[:name]}"
end

# VERB 'PATH' do
# execute code
# end