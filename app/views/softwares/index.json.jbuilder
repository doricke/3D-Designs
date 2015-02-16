json.array!(@softwares) do |software|
  json.extract! software, :design_id, :attachment_id, :software_name, :description
  json.url software_url(software, format: :json)
end
