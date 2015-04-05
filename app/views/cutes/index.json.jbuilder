json.array!(@cutes) do |cute|
  json.extract! cute, :id, :title, :url
  json.url cute_url(cute, format: :json)
end
