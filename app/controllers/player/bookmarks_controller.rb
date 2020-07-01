class Player::BookmarksController < ApplicationController
	def index
		@player = current_player
    	@bookmarks = Bookmark.joins(:team).where(player_id: @player.id).order(:prefecture_code).order(:city).order(member: "DESC")
    	# .joins(:team)により、bookmark/indexでも、teamカラムの条件(cityなど)が使えるようになる。
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