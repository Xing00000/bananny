class Profile < ApplicationRecord

end

class Child < Profile
	belongs_to :parent
end


