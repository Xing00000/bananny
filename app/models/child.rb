class Child < Profile
	belongs_to :parent
	has_many :cases

	def count_month
		(Time.now.to_date - self.birthdate.to_date).to_i/30
	end
end