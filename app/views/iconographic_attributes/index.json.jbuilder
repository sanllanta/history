json.array!(@iconographic_attributes) do |iconographic_attribute|
  json.extract! iconographic_attribute, :id, :name
  json.url iconographic_attribute_url(iconographic_attribute, format: :json)
end
