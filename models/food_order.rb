def all_bookings
  run_sql("SELECT * FROM booking")
end

def create_order(user_id, booking_name, date, time, meals)
  run_sql("INSERT INTO booking(user_id, booking_name, date, time, meals) VALUES($1 , $2, $3, $4, $5)", [user_id, booking_name, date, time, meals])
end

def create_food 
end

def update_order(id, user_id, booking_name, date, time, meals)
  run_sql("UPDATE booking SET user_id = $2, booking_name = $3, date = $4, time = $5, meals = $6 WHERE id = $1", [id, user_id, booking_name, date, time, meals])
end




def delete_order(id)
  run_sql("DELETE FROM booking WHERE id = $1", [id])
end

def get_order(id)
  run_sql("SELECT * FROM booking WHERE id = $1", [id])[0]
end



