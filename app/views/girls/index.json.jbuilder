json.array!(@girls) do |girl|
  json.extract! girl, :id, :title, :url
  json.url girl_url(girl, format: :json)
end
