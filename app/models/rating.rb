class Rating < ApplicationRecord
	belongs_to :case
	has_many :items
end
