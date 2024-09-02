json.extract! reservation, :id, :price, :status, :calicated, :User_id, :Room_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
