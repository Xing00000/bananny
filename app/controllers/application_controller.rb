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

	def end_time_number(params)
		params["end_time(4i)"].to_i*2 + params["end_time(5i)"].to_i/30
	end

	def helfhour_times(params)
		end_time_number(params[:end_time])-start_time_number(params[:start_time])
	end

	def search_nanny(params)
		nanies = Schedule.where("date = '#{params[:date]}'").where(:helfhour => start_time_number(params[:start_time])..end_time_number(params[:end_time])).group("nanny_id").count.select {|k,v| v >= helfhour_times(params)}.keys
		Nanny.find(nanies)
	end
end
