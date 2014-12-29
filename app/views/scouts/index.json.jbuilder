json.array!(@scouts) do |scout|
  json.extract! scout, :id, :user_id, :actual_club_id
  json.url scout_url(scout, format: :json)
end
