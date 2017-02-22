json.extract! photo, :id, :title, :body, :description, :slug, :created_at, :updated_at
json.url photo_url(photo, format: :json)