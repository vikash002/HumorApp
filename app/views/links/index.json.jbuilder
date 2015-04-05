json.array!(@links) do |link|
  json.extract! link, :id, :title, :url, :topic
  json.url link_url(link, format: :json)
end
