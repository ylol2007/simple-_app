json.extract! user, :id, :name, :phone, :email, :right, :string, :created_at, :updated_at
json.url user_url(user, format: :json)