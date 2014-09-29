json.array!(@scenes) do |scene|
  json.extract! scene, :id, :name
  json.url scene_url(scene, format: :json)
end
