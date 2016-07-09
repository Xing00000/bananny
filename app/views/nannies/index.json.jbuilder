json.array!(@nannies) do |nanny|
  json.extract! nanny, :id
  json.url nanny_url(nanny, format: :json)
end
