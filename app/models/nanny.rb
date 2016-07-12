class Nanny < Profile
	has_many :schedules , :dependent => :destroy
	belongs_to :user
end
