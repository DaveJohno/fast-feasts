def all_bookings
  run_sql("SELECT * FROM booking ORDER BY date ASC")
end

def create_booking(user_id, booking_name, date, time, meals)
  run_sql("INSERT INTO booking(user_id, booking_name, date, time, meals) VALUES($1 , $2, $3, $4, $5) RETURNING *", [user_id, booking_name, date, time, meals])[0]
end


def update_booking(id, user_id, booking_name, date, time, meals)
  run_sql("UPDATE booking SET user_id = $2, booking_name = $3, date = $4, time = $5, meals = $6 WHERE id = $1", [id, user_id, booking_name, date, time, meals])
end


def delete_from_bookings_table(id)
  run_sql("DELETE FROM booking WHERE id = $1", [id])
end

def get_order(id)
  run_sql("SELECT * FROM booking WHERE id = $1", [id])[0]
end


def create_food (order_id, user_id, meal, price, cooking_instructions)
  run_sql("INSERT INTO order_items(order_id, user_id, meal, price, cooking_instructions) VALUES($1 , $2, $3, $4, $5) RETURNING *", [order_id, user_id, meal, price, cooking_instructions])[0]
end

def find_user_by_id(id)
  run_sql("SELECT * FROM users WHERE id = $1", [id])[0]
end  

def find_meals_by_order_id(order_id)
  run_sql("SELECT * FROM order_items Where order_id = $2")
end

def find_meals_by_user_id(user_id)
  run_sql("SELECT * FROM order_items Where user_id = $2", [user_id])[0]
end

def all_order_items()
  run_sql("SELECT * FROM order_items")
end  

def order_items_where_order_id(order_id)
  run_sql("SELECT * FROM order_items WHERE order_id = $1", [order_id])
end  

def delete_from_order_item_table(order_id)
  run_sql("DELETE FROM order_items WHERE order_id = $1", [order_id])
end