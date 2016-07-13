class Case < ApplicationRecord
	belongs_to :parent
	belongs_to :nanny
	belongs_to :child
	has_many :ratings
end
