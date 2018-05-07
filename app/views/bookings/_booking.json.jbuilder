json.extract! booking, :id, :consultant_id, :consumer_id, :check_in, :checkout, :status, :service_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
