json.array!(@invites) do |invite|
  json.extract! invite, :id, :user, :invited, :team, :accepted
  json.url invite_url(invite, format: :json)
end
