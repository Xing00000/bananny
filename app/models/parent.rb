class Parent < Profile
	belongs_to :user
	has_many :childs
end
