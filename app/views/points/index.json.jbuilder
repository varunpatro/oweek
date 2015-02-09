json.array!(@points) do |point|
  json.extract! point, :id, :health, :attack
  json.url point_url(point, format: :json)
end
