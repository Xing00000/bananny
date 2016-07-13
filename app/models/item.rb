class Item < ApplicationRecord
	belongs_to :rating ,:class_name => "Rating" ,:foreign_key => "rating_id"
end
