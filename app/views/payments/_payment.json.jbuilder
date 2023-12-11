json.extract! payment, :id, :lease_id, :date, :amount, :payment_method, :month, :year, :created_at, :updated_at
json.url payment_url(payment, format: :json)
