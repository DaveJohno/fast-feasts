get '/sign_up' do
  erb :'users/new'
end

post '/users' do
  first_name = params["first_name"]
  last_name = params["last_name"]
  email = params["email"]
  phone = params["phone"]
  password = params["password"]

  create_user(first_name, last_name, email, phone, password)

  redirect '/'
end