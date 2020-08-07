class Player::TeamsController < ApplicationController
	before_action :authenticate_player!
	def index
		@q = Team.ransack(params[:q])
		@teams = @q.result(distinct: true).page(params[:page]).per(15).order(:prefecture_code).order(:city).order(member: "DESC")
	end

	def show
		@team = Team.find(params[:id])
		@posts = @team.posts.page(params[:page]).per(10).order(created_at: "DESC")
	end
end
