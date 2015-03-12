json.array!(@artworks) do |artwork|
  json.extract! artwork, :id, :authors, :activity, :biographic_data, :signed, :synthesis, :biographic_comment, :annotation, :sub_image, :comment
  json.url artwork_url(artwork, format: :json)
end
