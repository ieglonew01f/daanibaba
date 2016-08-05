json.extract! visitor, :id, :name, :email, :ip, :created_at, :updated_at
json.url visitor_url(visitor, format: :json)