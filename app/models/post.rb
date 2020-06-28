class Post < ApplicationRecord
	belongs_to :team
	attachment :post_image

	validates :title, presence: true
    validates :body, presence: true, length: {maximum: 300}
end
