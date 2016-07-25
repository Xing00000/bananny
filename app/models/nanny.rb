class Nanny < Profile
	has_many :schedules, :dependent => :destroy

  has_many :cases
  has_many :ratings, through: :cases
  has_many :items, through: :ratings

	belongs_to :user
	has_one :info

end
