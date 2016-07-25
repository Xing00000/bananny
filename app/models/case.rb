class Case < ApplicationRecord
	belongs_to :parent

  belongs_to :nanny

  has_many :ratings
  has_many :items, through: :ratings

	has_many :comments
end
