class Parent < Profile
	has_many :children
	has_many :cases
	belongs_to :user
end
