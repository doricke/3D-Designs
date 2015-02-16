json.array!(@licenses) do |license|
  json.extract! license, :license_name, :license_version, :license_url
  json.url license_url(license, format: :json)
end
