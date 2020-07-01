class Player::PostsController < ApplicationController
	def index
		@q = Post.ransack(params[:q])
		if params[:team_id].nil? # 投稿一覧出力時に、チームidが含まれているかどうか。
			@posts = @q.result(distinct: true).page(params[:page]).per(10).order(created_at: "DESC")
		else
			@posts = @q.result(distinct: true).where(team_id: params[:team_id]).page(params[:page]).per(10).order(created_at: "DESC")
		end
	end

	def show
		@post = Post.find(params[:id])
	end
end