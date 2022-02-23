
def create_order(user_id, booking_name, date, time, meals)
  run_sql("INSERT INTO booking(user_id, booking_name, date, time, meals) VALUES($1 , $2, $3,$4, $5)", [booking_name, date, time, meals])
end



def update_order(id, user_id, booking_name, date, time, meals)
  run_sql("UPDATE booking SET user_id = $2, booking_name = $3, date = $4, time = $5, meals = $6 WHERE id = $1", [id, user_id, booking_name, date, time, meals])
end

def delete_food(id)
  run_sql("DELETE FROM food WHERE id = $1", [id])
end