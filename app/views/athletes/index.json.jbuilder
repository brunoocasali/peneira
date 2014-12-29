json.array!(@athletes) do |athlete|
  json.extract! athlete, :id, :user_id, :birthday, :height, :weight, :foot_id, :position_id, :allow_to_travel
  json.url athlete_url(athlete, format: :json)
end
