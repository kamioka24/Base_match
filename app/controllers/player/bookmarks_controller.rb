class Player::BookmarksController < ApplicationController
	def index
	end

	def create
		@team = Team.find(params[:team_id])
	end

	def destroy
		@team = Team.find(params[:team_id])
	end
end
