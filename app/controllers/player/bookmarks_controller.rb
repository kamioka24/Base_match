class Player::BookmarksController < ApplicationController
	def index
		@player = current_player
    	@bookmarks = Bookmark.joins(:team).where(player_id: @player.id).order(:prefecture_code).order(:city).order(member: "DESC")
    	# .joins(:team)により、bookmark/indexでも、teamカラムの条件(cityなど)が使えるようになる。
	end

	def create
		@team = Team.find(params[:team_id])
		@bookmark = current_player.bookmarks.new(team_id: @team.id)
		@bookmark.save
	end

	def destroy
		@team = Team.find(params[:team_id])
		@bookmark = current_player.bookmarks.find_by(team_id: @team.id)
		@bookmark.destroy
	end
end