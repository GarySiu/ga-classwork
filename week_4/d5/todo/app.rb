require 'sinatra'
require 'sinatra/reloader' if production?
require 'pry'
require 'pg'

before do
  @db = PG.connect(dbname: 'todo_app', host: 'localhost')
end

after do
  @db.close
end

get '/' do
  redirect to '/notes'
end

get '/notes' do # INDEX
  sql = "SELECT * FROM notes"
  @list_todos = @db.exec(sql)
  # binding.pry
  erb :index
end

get '/notes/new' do # NEW
  erb :new
end

post '/notes/' do # CREATE
  # binding.pry

  params[:task].gsub!("'", "''")

  sql = "INSERT INTO NOTES (title, task) VALUES ('#{params[:title]}', '#{params[:task]}')"
  @db.exec(sql)

  sql = "SELECT * FROM notes"
  @list_todos = @db.exec(sql)
  # binding.pry
  redirect to '/notes'
end

get '/notes/:id' do # SHOW
  sql = "SELECT * FROM notes WHERE id = #{params[:id]}"
  @list_todos = @db.exec(sql)
  erb :index
end

get '/notes/:id/edit' do # EDIT
  sql = "SELECT * FROM notes WHERE id = #{params[:id]}"
  erb :new
end

post '/notes/:id' do # UPDATE

end

get '/notes/:id/delete' do # DELETE
  "SCARY DELETE PAGE"
end