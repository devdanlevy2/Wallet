json.array!(@exchanges) do |exchange|
  json.extract! exchange, :id, :amount, :recipient
  json.url exchange_url(exchange, format: :json)
end
