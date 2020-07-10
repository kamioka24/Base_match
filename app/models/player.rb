class Player < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
		   :recoverable, :rememberable, :validatable

	has_many :bookmarks, dependent: :destroy
	has_many :contacts, dependent: :destroy

	validates :name, presence: true, length: {maximum: 15}

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