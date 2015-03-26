# Load up sinatra and mongoid (Mongo ORM)
require 'sinatra'
require 'mongoid'
# load the user model
require './models/user'

# Sinatra needs some extra config that Rails gives us
# here is where we load the db config
configure do
  Mongoid.load!('./config/mongoid.yml')
end

# load the user model before each request
before do
  @users = User
end

# get all the users
get '/' do
  @users = @users.all
  haml :index
end

# form post route that creates the user and redirects back to home
post '/users' do
  User.create(username: params[:username])
  redirect to '/'
end