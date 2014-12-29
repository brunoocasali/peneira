json.array!(@preferences) do |preference|
  json.extract! preference, :id, :share_email, :share_phone
  json.url preference_url(preference, format: :json)
end
