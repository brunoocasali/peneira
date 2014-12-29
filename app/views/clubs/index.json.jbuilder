json.array!(@clubs) do |club|
  json.extract! club, :id, :name, :founded, :address_id
  json.url club_url(club, format: :json)
end
