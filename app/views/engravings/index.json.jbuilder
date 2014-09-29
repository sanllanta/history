json.array!(@engravings) do |engraving|
  json.extract! engraving, :id, :name
  json.url engraving_url(engraving, format: :json)
end
