json.array!(@confessions) do |confession|
  json.extract! confession, :id, :description
  json.url confession_url(confession, format: :json)
end
