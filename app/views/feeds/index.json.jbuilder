json.array!(@feeds) do |feed|
  json.extract! feed, :name, :url, :created
  json.url feed_url(feed, format: :json)
end
