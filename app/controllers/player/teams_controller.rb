class Player::TeamsController < ApplicationController
	def index
		# @teams = Team.page(params[:page]).per(20)
		@q = Team.ransack(params[:q])
		@teams = @q.result(distinct: true).order(:prefecture_code).order(:city)
	end

	def show
		@team = Team.find(params[:id])
		@posts = Post.page(params[:page]).per(8).order(created_at: "DESC") #降順
	end
end
