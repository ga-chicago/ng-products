class UserController < Sinatra::Base
  options '*' do
    response['Access-Control-Allow-Origin'] = '*'
    response['Access-Control-Allow-Headers'] = 'content-type'
    response['Access-Control-Allow-Methods'] = 'GET,POST,PATCH,DELETE'
    200
  end

  #post request to /users/register
  post '/register' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    user_details = JSON.parse(request.body.read)
    user = User.new

    user.email = user_details["email"]
    user.password = user_details["password"]
    user.token = rand(1..1000000000000)

    user.save
    user.to_json
  end

  #post request to /users/login
  post '/login' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    user_details = JSON.parse(request.body.read)
    user = User.find_by({email: user_details["email"]})
    if user && user.authenticate(user_details["password"])
      user.to_json
    else
      "ACCESS DENIED"
    end
  end
end
