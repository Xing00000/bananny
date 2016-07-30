class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :user_should_be_registered

  # def count_input_times(params)
  #   hour = params["end_at(4i)"].to_i - params["start_at(4i)"].to_i
  #   helfhour = (params["end_at(5i)"].to_i - params["start_at(5i)"].to_i)/30
  #   input = hour*2 + helfhour
  # end

 	def start_date(params)
		if params[:date]
			(params[:date] +" "+ params[:start_date]).to_time
		else
			params[:start_date].to_time
		end
	end

	def end_date(params)
		if params[:date]
			(params[:date] +" "+ params[:end_date]).to_time
		else
			params[:end_date].to_time
		end
	end

	# def helfhour_times(params)
	# 	end_time_number(params[:end_time])-start_time_number(params[:start_time])
	# end
	def count_input_times(params)
		(end_date(params) - start_date(params))/1800
	end

	def search_nanny(params)
		# nanny_ids = Schedule.find_available_nannies(start_date(params), end_date(params))
	 	nanies = Schedule.where("start_date>=? and start_date < ?",start_date(params) ,end_date(params)).where(:case_id => nil).group(:nanny_id).count.select {|k,v| v >= count_input_times(params)}.keys
		Nanny.find(nanies)
	end

	def user_should_be_registered
		if current_user != nil && current_user.registered? == nil
			redirect_to registered_user_path(current_user)
		end
	end

	def session_start_date(session)
		(session["date"] + " " + session["start_date"]).to_time
	end

	def session_end_date(session)
		(session["date"] + " " + session["end_date"]).to_time
	end

	def session_count(session)
		(end_date(session)-start_date(session))/1800
	end


end
