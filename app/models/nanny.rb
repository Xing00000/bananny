class Nanny < Profile
	has_many :schedules, :dependent => :destroy

  has_many :cases
  has_many :ratings, through: :cases
  has_many :items, through: :ratings

	belongs_to :user
	has_one :info


	def check_schedule?(session)
		schedules = self.schedules.where("start_date>=? and start_date < ?",start_date(session),end_date(session)).where(:case_id => nil).count
		schedules == count(session)
	end

	def start_date(session)
		(session["date"] + " " + session["start_date"]).to_time
	end

	def end_date(session)
		(session["date"] + " " + session["end_date"]).to_time
	end

	def count(session)
		(end_date(session)-start_date(session))/1800
	end


end
