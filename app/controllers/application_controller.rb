class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # def count_input_times(params)
  #   hour = params["end_at(4i)"].to_i - params["start_at(4i)"].to_i
  #   helfhour = (params["end_at(5i)"].to_i - params["start_at(5i)"].to_i)/30
  #   input = hour*2 + helfhour
  # end

 	# def start_date(params)
	# 	params[:start_date] + params["start_date(4i)"] + params["start_date(5i)"]
	# end

	# def end_date(params)
	# 	params["end_time(4i)"].to_i*2 + params["end_time(5i)"].to_i/30
	# end

	# def helfhour_times(params)
	# 	end_time_number(params[:end_time])-start_time_number(params[:start_time])
	# end
	def count_input_times(params)
		(params[:end_date].to_time-params[:start_date].to_time)/1800
	end
	def search_nanny(params)
	 	nanies = Schedule.where("start_date>=? and start_date < ?",params[:start_date].to_time(:utc),params[:end_date].to_time(:utc)).group(:nanny_id).count.select {|k,v| v >= count_input_times(params)}.keys
		Nanny.find(nanies)
	end
end
