require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
set :database, { adapter: "sqlite3", database: "mydb.db" }
require './models/user'
require './models/team'

get '/' do
    User.all.to_yam1 + Team.all.to_yam1
end

get '/users1' do
    @users = Users.all
    erb :users1
end

get '/users2' do
    @users = User.all
    erb :users2
end

post '/show_user' do
    @users = User.find_by(name: params[:name])
    if @user.nil?
       return "User not found"
    end
    erb :user
end

post '/user/:id' do
    @users = User.find_by(name: params[:id])
    if @user.nil?
       return "User not found"
    end
    erb :user
end

