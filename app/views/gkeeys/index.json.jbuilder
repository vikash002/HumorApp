json.array!(@gkeeys) do |gkeey|
  json.extract! gkeey, :id, :title, :url
  json.url gkeey_url(gkeey, format: :json)
end
