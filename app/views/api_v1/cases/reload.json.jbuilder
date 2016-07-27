json.result do
  json.extract! @case, :id, :status

  json.comments @case.comments
end

if @case.present?
  json.status 200
else
  json.status 400
end