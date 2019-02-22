json.extract! user, :first_name, :last_name, :id, :email, :password, :password_confirmation, :created_at, :updated_at
json.url user_url(user, format: :json)
