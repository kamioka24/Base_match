class Player::TeamsController < ApplicationController
	def index
		@teams = Team.page(params[:page]).per(10)
	end

	def show
		@team = Team.find(params[:id])
	end
end
