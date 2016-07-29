json.result do
  json.extract! @case, :id, :status
end
json.comments do
  json.array! @case.comments.each do |comment|
    json.id comment.id
    json.comment comment.comment
  end
end

if @case.present?
  json.status 200
else
  json.status 400
end