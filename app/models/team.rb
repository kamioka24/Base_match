class Team < ApplicationRecord
	attr_accessor :prefecture_name
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :validatable

	has_many :posts, dependent: :destroy
	has_many :bookmarks, dependent: :destroy
	attachment :team_image

	validates :team_image, presence: true
	validates :name, presence: true, length: {maximum: 20}
	validates :member, numericality: :only_integer, length: {maximum: 3} # 数値のみ 3桁まで
	validates :category, presence: true
	# validates :introduction, presence: true, length: {in: 20..300}
	validates :city, presence: true, length: {in: 2..8}
	validates :street, presence: true, length: {in: 2..20}
	validates :phone_number, numericality: :only_integer, length: {in: 2..20} # 数値のみ

	enum category: {硬式: 0, 軟式: 1}

	def bookmarked_by?(player) # チームに自分(current_player)のブックマークが既にあるか判断する
            bookmarks.where(player_id: player.id).exists? # exists = 存在
    end

    geocoded_by :street # 番地を登録した際に緯度、経度のカラムに自動で値を入れてくれる。
    after_validation :geocode, if: :street_changed? # 番地を変更した際に、自動でgeocodingされる。

    # prefecture_codeからprefecture_nameに変換する
    include JpPrefecture
  	jp_prefecture :prefecture_code

  	def prefecture_name
  		self.prefecture_name = JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
	end

	def prefecture_name=(prefecture_name)
    	self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
	end
end