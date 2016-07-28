class Case < ApplicationRecord
	belongs_to :parent

  belongs_to :nanny

  has_many :ratings
  has_many :items, through: :ratings

	has_many :comments


	def show_time
		self.start_date.strftime('%H:%M')+"~"+ self.end_date.strftime('%H:%M')
	end

	def show_hour
		(self.end_date - self.start_date)/3600
	end

end
