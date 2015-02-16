json.array!(@instruments) do |instrument|
  json.extract! instrument, :instrument_type_id, :instrument_name, :instrument_model
  json.url instrument_url(instrument, format: :json)
end
