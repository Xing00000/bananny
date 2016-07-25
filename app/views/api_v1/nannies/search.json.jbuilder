json.result do
  json.array! @nannies_found do |nanny|
    json.first_name nanny.first_name
    json.last_name nanny.last_name
    json.image nanny.try(:image)

    # first_name, last_name, image, rating, weekday_charge, number_of_case, start_time (limit of 3 nannies, nanny_id)

  end
end
json.status 200
