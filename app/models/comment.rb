class Comment < ApplicationRecord
	validates_presence_of :comment
	belongs_to :case
	belongs_to :user
end
