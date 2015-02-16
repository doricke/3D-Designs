json.array!(@teams) do |team|
  json.extract! team, :team_name
  json.url team_url(team, format: :json)
end
