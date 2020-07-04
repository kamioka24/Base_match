class Player::PostsController < ApplicationController
	before_action :authenticate_player!
	def index
		@q = Post.ransack(params[:q])
		if params[:team].nil? # 投稿一覧出力時に、チームidが含まれているかどうか。
			@posts = @q.result(distinct: true).page(params[:page]).per(10).order(created_at: "DESC")
		else
			@posts = @q.result(distinct: true).where(team_id: params[:team]).page(params[:page]).per(10).order(created_at: "DESC")
		end
	end

	def show
		@post = Post.find(params[:id])
		@team = Team.find(params[:id])
		@posts = Post.page(params[:page]).per(8).order(:prefecture_code).order(created_at: "DESC")
	end
end