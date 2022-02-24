get '/' do
  bookings = all_bookings()
  erb :'fast_feasts/index',  locals: {
    bookings: bookings
  }
end

get '/fast_feasts/new-order' do
  bookings = all_bookings()
  id = find_user_by_id(current_user["id"])
  # order_id = find_meals_by_order_id(get_order(id))
  

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

  order = create_booking(user_id, booking_name, date, time, meals)

  redirect "/fast_feasts/#{order["id"]}/add_food"
end


delete '/fast_feasts/:id' do
  id = params["id"]
  order_id = params["id"]

  delete_from_bookings_table(id)
  delete_from_order_item_table(order_id)
  redirect '/'
end


get '/fast_feasts/:id/edit' do
  id = params["id"].to_i
  order_id = id
  order = get_order(id)
  meals = order_items_where_order_id(order_id)
  
  erb :'fast_feasts/edit', locals: {
    id: id,
    order: order,
    order_id: order_id,
    meals: meals
  }
end  


put '/fast_feasts/:id' do
  user_id = session['user_id']
  id = params['id']
  meals = params["meals"]
  booking_name = params["booking_name"]
  date = params["date"]
  time = params["time"]
  meals = ""

  update_booking(id, user_id, booking_name, date, time, meals)

  redirect '/'
end


get '/fast_feasts/:id/add_food' do
  id = params["id"]
  order = get_order(id)

  erb :'/fast_feasts/add_food', locals: {
    id: id,
    order: order,
  }
end

post '/fast_feasts/:id/add_food' do
  order_id = params["order_id"]
  user_id = session["user_id"]
  price = params['price']
  meal = params["meal"]
  cooking_instructions = params["cooking_instructions"]

  create_food(order_id, user_id, meal, price, cooking_instructions)

  redirect '/'
end