json.result do
  json.extract! @parent, :id, :first_name, :last_name

  json.items @items
  json.score @items_avg
end

if @parent.present?
  json.status 200
else
  json.status 400
end