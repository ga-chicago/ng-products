require 'bundler'
Bundler.require

require './models/RaincoatModel'

require './controllers/RaincoatController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'products'
)

map('/raincoats'){run RaincoatController}
