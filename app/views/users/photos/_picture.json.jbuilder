json.extract! picture, :id, :title, :body, :description, :slug, :created_at, :updated_at
json.url picture_url(picture, format: :json)