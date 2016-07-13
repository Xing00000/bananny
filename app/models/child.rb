class Child < Profile
	belongs_to :parent
	has_many :cases
end