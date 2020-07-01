class Player::PostsController < ApplicationController
	def index
		if params[:team_id].nil? # 投稿一覧出力時に、チームidが含まれているかどうか。
			@posts = Post.page(params[:page]).per(10).order(created_at: "DESC") # 降順
        else
        	@posts = Post.where(team_id: params[:team_id]).page(params[:page]).per(10)
        end
		@q = Team.ransack(params[:q])
		@post = @q.result(distinct: true)
	end

	def show
		@post = Post.find(params[:id])
	end
end
