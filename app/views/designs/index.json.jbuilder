json.array!(@designs) do |design|
  json.extract! design, :user_id, :team_id, :instrument_id, :design_name, :revision, :rating, :views, :downloads, :created_at, :updated_at
  json.url design_url(design, format: :json)
end
