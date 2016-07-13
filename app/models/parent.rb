class Parent < Profile
	belongs_to :user
	has_many :childs
	has_many :cases
end
