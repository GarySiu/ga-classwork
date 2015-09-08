require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'
require 'pg'
require 'httparty'

before do
  @db = PG.connect(dbname: 'movies_app', host: 'localhost')
end

after do
  @db.close
end

get '/' do
  if params[:title]

    movie_name = params[:title].downcase.gsub(' ', '+')
    movie_object = HTTParty.get "http://www.omdbapi.com/?t=#{movie_name}"
    # binding.pry

    @movie_hash = movie_object
    @movie_hash = movie_object.each {|key, value| value.gsub!("'","''") }

    sql = "INSERT INTO movies (title, poster, year, released, runtime,
    genre, director, writers, actors, plot)
    VALUES 
    ('#{@movie_hash['Title']}',
    '#{@movie_hash['Poster']}',
    '#{@movie_hash['Year']}',
    '#{@movie_hash['Released']}',
    '#{@movie_hash['Runtime']}',
    '#{@movie_hash['Genre']}',
    '#{@movie_hash['Director']}',
    '#{@movie_hash['Writer']}',
    '#{@movie_hash['Actors']}',
    '#{@movie_hash['Plot']}') RETURNING *"
    # binding.pry
    new_movie = @db.exec(sql)
    new_movie.each { |movie| puts "#{@movie_hash['Title']} has been put into the database. Hopefully."}
  end
  erb :index
end

get '/movies' do
  @movie_list = @db.exec('SELECT * FROM movies')
  erb :movies
end

get '/movies/:name' do
  @movie_list = @db.exec("SELECT * FROM movies WHERE title LIKE '%#{params[:name]}%'")
  erb :selected_movies
end