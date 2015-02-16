json.array!(@design_licenses) do |design_license|
  json.extract! design_license, :design_id, :license_id
  json.url design_license_url(design_license, format: :json)
end
