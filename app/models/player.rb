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

	# ゲストプレイヤーの登録条件
	def self.guest
    find_or_create_by!(email: 'guest@example.com') do |player|
    	player.name = SecureRandom.urlsafe_base64(5)
    	player.prefecture_name = "埼玉県" # 今回は1番チーム登録の多い埼玉県を採用
      player.password = SecureRandom.urlsafe_base64
    end
  end
end