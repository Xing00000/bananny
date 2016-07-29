module ApplicationHelper

	def time_of_experience(time)
		days = (Time.now.to_date - time.to_date).to_i
		"#{(days/365).to_s} 年#{(days/30%12).to_s}個月"
	end

	def baby_age(time)
		days = (Time.now.to_date - time.to_date).to_i
		"#{(days/365).to_s} 歲#{(days/30%12).to_s}個月"
	end

end
