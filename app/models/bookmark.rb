class Bookmark < ApplicationRecord
  belongs_to :player
  belongs_to :team

  #ひとりが１チームに対して１つしかブックマークをつけられないようにする
  validates_uniqueness_of :team_id, scope: :player_id

  def bookmarked_by?(player) # チームに自分(current_player)のブックマークが既にあるか判断する
            bookmarks.where(player_id: player.id).exists? # exists = 存在
    end
end