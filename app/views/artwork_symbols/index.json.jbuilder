json.array!(@artwork_symbols) do |artwork_symbol|
  json.extract! artwork_symbol, :id
  json.url artwork_symbol_url(artwork_symbol, format: :json)
end
