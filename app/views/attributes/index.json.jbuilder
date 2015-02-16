json.array!(@attributes) do |attribute|
  json.extract! attribute, :attribute_name
  json.url attribute_url(attribute, format: :json)
end
