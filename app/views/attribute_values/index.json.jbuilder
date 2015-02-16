json.array!(@attribute_values) do |attribute_value|
  json.extract! attribute_value, :design_id, :attribute_id, :attribute_type, :attribute_int, :attribute_float, :attribute_string, :attribute_boolean
  json.url attribute_value_url(attribute_value, format: :json)
end
