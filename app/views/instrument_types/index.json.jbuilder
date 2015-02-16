json.array!(@instrument_types) do |instrument_type|
  json.extract! instrument_type, :category
  json.url instrument_type_url(instrument_type, format: :json)
end
