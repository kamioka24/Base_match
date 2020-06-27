class Player::BookmarksController < ApplicationController
	def index
		@player = current_player
    	@bookmarks = Bookmark.where(player_id: @player.id).all
	end

	def create
		@team = Team.find(params[:team_id])
		bookmark = current_player.bookmarks.new(team_id: params[:team_id])
		bookmark.save
		redirect_back(fallback_location: root_path) # bookmarkする前の画面に戻る
	end

	def destroy
		@team = Team.find(params[:team_id])
		bookmark = current_player.bookmarks.find_by(team_id: @team.id)
		bookmark.destroy
		redirect_back(fallback_location: root_path) # bookmarkする前の画面に戻る
	end
end
