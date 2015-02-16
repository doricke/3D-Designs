json.array!(@performances) do |performance|
  json.extract! performance, :design_id, :attachment_id, :name, :description, :metric, :rating, :updated_at
  json.url performance_url(performance, format: :json)
end
