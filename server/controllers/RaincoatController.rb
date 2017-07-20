class RaincoatController < Sinatra::Base

  options '*' do
    response['Access-Control-Allow-Origin'] = '*'
    response['Access-Control-Allow-Headers'] = 'content-type'
    response['Access-Control-Allow-Methods'] = 'GET,POST,PATCH,DELETE'
    200
  end

  get '/' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    raincoats = Raincoat.all
    raincoats.to_json
  end

  get '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    raincoat = Raincoat.find(id)
    raincoat.to_json
  end

  post '/' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    request_body = JSON.parse(request.body.read)
    raincoat = Raincoat.new(request_body)
    raincoat.save
    Raincoat.all.to_json
  end

  patch '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    raincoat = Raincoat.find(id)
    request_body = JSON.parse(request.body.read)
    raincoat.update_attributes(request_body)
    raincoat.save
    Raincoat.all.to_json
  end

  delete '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    raincoat = Raincoat.find(id)
    raincoat.destroy
    Raincoat.all.to_json
  end
end
