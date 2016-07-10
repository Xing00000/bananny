class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def schedule_input_times(params)
    hour = params["end_time(4i)"].to_i - params["start_time(4i)"].to_i
    helfhour = (params["end_time(5i)"].to_i - params["start_time(5i)"].to_i)/30
    input = hour*2 + helfhour
  end
  def start_time_number(params)
		params["start_time(4i)"].to_i*2 + params["start_time(5i)"].to_i/30
	end
end
