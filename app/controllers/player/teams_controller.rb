class Player::TeamsController < ApplicationController
	def index
		@teams = Team.page(params[:page]).per(10)
		@q = Team.ransack(params[:q])
		@team = @q.result(distinct: true)
	end

	def show
		@team = Team.find(params[:id])
	end
end
