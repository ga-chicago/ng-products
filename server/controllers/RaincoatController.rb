class RaincoatController < ApplicationController

  get '/' do
    raincoats = Raincoat.all
    raincoats.to_json
  end

  get '/:id' do
    id = params[:id]
    raincoat = Raincoat.find(id)
    raincoat.to_json
  end

  post '/' do
    request_body = JSON.parse(request.body.read)
    raincoat = Raincoat.new(request_body)
    raincoat.save
    Raincoat.all.to_json
  end

  patch '/:id' do
    id = params[:id]
    raincoat = Raincoat.find(id)
    request_body = JSON.parse(request.body.read)
    raincoat.update_attributes(request_body)
    raincoat.save
    Raincoat.all.to_json
  end

  delete '/:id' do
    id = params[:id]
    raincoat = Raincoat.find(id)
    raincoat.destroy
    Raincoat.all.to_json
  end
end
