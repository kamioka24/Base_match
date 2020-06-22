class Post < ApplicationRecord
	belongs_to :team
	attachment :post_image
end
