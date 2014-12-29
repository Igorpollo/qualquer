json.array!(@feeds) do |feed|
  json.extract! feed, :id, :texto
  json.url feed_url(feed, format: :json)
end
