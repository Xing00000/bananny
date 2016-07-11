class Nanny < Profile
	has_many :schedules , :dependent => :destroy
end
