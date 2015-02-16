json.array!(@deriveds) do |derived|
  json.extract! derived, :design_id, :source_id, :derived_type
  json.url derived_url(derived, format: :json)
end
