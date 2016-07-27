json.result do
  json.extract! @case, :id, :status
end

if @case.status == 'booked'?
  json.status 200
else
  json.status 400
end