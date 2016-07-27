json.result do
  #json.partial! 'nannies/nanny', collection: @nannies_found, as: :nanny

  json.array! @nannies_found do |nanny_id|
    nanny = Nanny.find(nanny_id)
    json.nanny do
      json.nanny nanny

      schedules = nanny.schedules
      json.schedules do
        json.array! schedules do |schedule|
          json.schedule do
            json.start_date schedule.start_date
            json.end_date schedule.end_date
            json.case_id schedule.case_id
            json.text schedule.text
          end
        end
      end

      ratings = nanny.ratings
      json.ratings do
        json.array! ratings do |rating|
          json.rating rating

          items = rating.items
          json.items items
        end
      end

      info = nanny.info
      json.info info

      cases = nanny.cases
      json.cases do
        json.array! cases do |each_case|
          json.each_case each_case
        end
      end

    end

    # first_name, last_name, image, rating, weekday_charge, number_of_case, start_time (limit of 3 nannies, nanny_id)

  end
end
json.status 200
