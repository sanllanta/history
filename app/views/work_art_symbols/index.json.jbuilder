json.array!(@work_art_symbols) do |work_art_symbol|
  json.extract! work_art_symbol, :id, :name
  json.url work_art_symbol_url(work_art_symbol, format: :json)
end
