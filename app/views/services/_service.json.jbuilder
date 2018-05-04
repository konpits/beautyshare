json.extract! service, :id, :title, :description, :price_per_hour, :min_duration, :max_duration, :image_data, :user_id, :category_id, :created_at, :updated_at
json.url service_url(service, format: :json)
