json.array!(@memes) do |meme|
  json.extract! meme, :id, :title, :url
  json.url meme_url(meme, format: :json)
end
