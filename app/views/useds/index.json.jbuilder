json.array!(@useds) do |used|
  json.extract! used, :design_id, :user_id, :comment_id, :created_at
  json.url used_url(used, format: :json)
end
