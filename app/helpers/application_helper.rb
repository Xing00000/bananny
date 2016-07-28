module ApplicationHelper

	def start_date(session)
		(session[:date] +" "+ session[:start_date]).to_time
	end

	def end_date(session)
		(session[:date] +" "+ params[:end_date]).to_time
	end

	def count(session)
		(end_date(session)-start_date(session))/1800
	end

end
