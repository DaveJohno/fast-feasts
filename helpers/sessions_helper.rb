# Ruby conveention: methods with a question mark always return a boolean value
def logged_in?
  !!session['user_id']
end

def current_user
  if logged_in?
    find_user_by_id(session['user_id'])
  else
    nil
  end  
end

def has_order?
  if find_meals_by_user_id == !!session['user_id']
  end
end

def current_order
  if has_order?
    find_meals_by_order_id()
  else
    nil
  end
end