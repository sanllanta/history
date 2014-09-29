json.array!(@phylactery_billboards) do |phylactery_billboard|
  json.extract! phylactery_billboard, :id, :name
  json.url phylactery_billboard_url(phylactery_billboard, format: :json)
end
