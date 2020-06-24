class Team < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :validatable

	has_many :posts, dependent: :destroy
	has_many :bookmarks, dependent: :destroy
	attachment :team_image

	enum category: {硬式: 0, 軟式: 1}

	def address
		prefecture_code + city + street
	end
end
