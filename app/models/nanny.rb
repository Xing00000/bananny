class Nanny < Profile
	has_many :schedules , :dependent => :destroy
	has_many :cases
	belongs_to :user
	has_one :info

end
