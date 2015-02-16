json.array!(@comments) do |comment|
  json.extract! comment, :design_id, :user_id, :rating, :updated_at, :comments
  json.url comment_url(comment, format: :json)
end
