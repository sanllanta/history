json.array!(@passages) do |passage|
  json.extract! passage, :id, :name
  json.url passage_url(passage, format: :json)
end
