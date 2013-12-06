json.array!(@feeds) do |feed|
  json.extract! feed, :name, :feed_url, :last_modified
  json.url feed_url(feed, format: :json)
end
