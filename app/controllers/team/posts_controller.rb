class Team::PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.team_id = current_team.id # この投稿は誰がしたものなのか(今回で言うとチームid)を定義していないと反映されず投稿できない。
		if @post.save
		   redirect_to team_post_path(@post), notice: "投稿が完了しました。"
		else
		   render "new"
		end
	end

	def index
		@posts = Post.page(params[:page]).per(10).order(created_at: "DESC") #降順
		@q = Team.ransack(params[:q])
		@post = @q.result(distinct: true)
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
		   redirect_to team_post_path, notice: "投稿を編集しました。"
		else
		   render "edit"
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to team_posts_path, notice: "投稿を削除しました。"
	end

	private

	def post_params
		params.require(:post).permit(:team_id, :title, :body, :post_image)
	end
end
