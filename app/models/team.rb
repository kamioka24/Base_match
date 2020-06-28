class Team < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :validatable

	has_many :posts, dependent: :destroy
	has_many :bookmarks, dependent: :destroy
	attachment :team_image

	validates :name, presence: true, length: {maximum: 20}
	validates :member, presence: true, length: {maximum: 3} # 3桁まで
	validates :category, presence: true
	validates :introduction, presence: true, length: {in: 20..300}
	validates :city, presence: true, length: {in: 2..8}
	validates :street, presence: true, length: {in: 2..20}
	validates :phone_number, presence: true, length: {in: 2..20}

	enum category: {硬式: 0, 軟式: 1}

	def address
		prefecture_code + city + street
	end

	def bookmarked_by?(player) # チームに自分(current_player)のブックマークが既にあるか判断する
            bookmarks.where(player_id: player.id).exists? # exists = 存在
    end
end
