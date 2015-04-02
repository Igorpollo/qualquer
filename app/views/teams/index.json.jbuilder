json.array!(@teams) do |team|
  json.extract! team, :id, :name, :captain, :wins
  json.url team_url(team, format: :json)
end
