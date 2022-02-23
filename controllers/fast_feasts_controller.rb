get '/' do
  bookings = all_bookings()
  erb :'fast_feasts/index',  locals: {
    bookings: bookings
  }
end

get '/fast_feasts/new-order' do
  bookings = all_bookings()
  id = find_user_by_id(current_user["id"])
  

  erb :'fast_feasts/new-order', locals: {
    bookings: bookings
  }
end



post '/fast_feasts/new-order' do
  user_id = session['user_id']

  meals = params["meals"]
  booking_name = params["booking_name"]
  date = params["date"]
  time = params["time"]
  meals = params["meals"]

  create_order(user_id, booking_name, date, time, meals)
  
  redirect "/fast_feasts/new-order"
end

delete '/fast_feasts/:id' do
  id = params["id"]

  delete_order(id)

  redirect '/fast_feasts/new-order'
end


get '/fast_feasts/:id/edit' do
  id = params["id"]
  
  order = get_order(id)
  
  erb :'fast_feasts/edit', locals: {
    id: id,
    order: order
  }
end  