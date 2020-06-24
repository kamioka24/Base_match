class Bookmark < ApplicationRecord
	belongs_to :player
	belongs_to :team

	#ひとりが１チームに対して１つしかブックマークをつけられないようにする
	validates_uniqueness_of :team_id, scope: :player_id
end
