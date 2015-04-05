json.array!(@wtfs) do |wtf|
  json.extract! wtf, :id, :title, :url
  json.url wtf_url(wtf, format: :json)
end
