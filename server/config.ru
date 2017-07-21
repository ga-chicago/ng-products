require 'bundler'
Bundler.require

require './models/RaincoatModel'
require './models/UserModel'

require './controllers/ApplicationController'
require './controllers/RaincoatController'
require './controllers/UserController'


run Sinatra::Application

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'products'
)

map('/raincoats'){run RaincoatController}
map('/users'){run UserController}
