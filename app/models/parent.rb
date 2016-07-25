class Parent < Profile
	has_many :children

  has_many :cases
  has_many :ratings, through: :cases
  has_many :items, through: :ratings

	belongs_to :user
end
