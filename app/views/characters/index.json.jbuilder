json.array!(@characters) do |character|
  json.extract! character, :id, :name, :biography, :death_date, :beatification_date, :canonization_date
  json.url character_url(character, format: :json)
end
