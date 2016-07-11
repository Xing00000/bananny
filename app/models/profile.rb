class Profile < ApplicationRecord
	belongs_to :user
end

class Parent < Profile
end


