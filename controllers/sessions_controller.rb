get '/login' do
  erb :'sessions/new'
end

post '/sessions' do 
  email = params['email']
  password = params['password']

  user = find_user_by_email(email)

  #using BCrypt to check if the user provided to correct password
  if user && BCrypt::Password.new(user['password_digest']) == params['password']
    #log the user in
    session['user_id'] = user['id']
  end

  redirect '/'
end

delete '/sessions' do
  session["user_id"] = nil
  redirect '/'
end