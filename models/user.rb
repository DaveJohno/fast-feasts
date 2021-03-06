# We are using the user model to talk to the user table in the database
def create_user(first_name,last_name, email,phone, password)

  password_digest = BCrypt::Password.create(password)

  run_sql("INSERT INTO users(first_name, last_name, email, phone, password_digest) VALUES ($1, $2, $3, $4, $5)", [first_name, last_name, email, phone, password_digest])
end


def find_user_by_email(email)
  users = run_sql("SELECT * FROM users WHERE email = $1", [email])
  if users.to_a.count > 0
    users[0]
  else 
    nil
  end
end

