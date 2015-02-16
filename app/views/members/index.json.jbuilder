json.array!(@members) do |member|
  json.extract! member, :team_id, :user_id, :role
  json.url member_url(member, format: :json)
end
