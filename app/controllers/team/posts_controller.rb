class Team::PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
		   redirect_to team_posts_path, notice: "投稿が完了しました。"
		else
		   render "new"
		end
	end

	def index
		@posts = Post.all.order(created_at: "DESC") #降順
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update
		   redirect_to team_post_path, notice: "投稿を編集しました。"
		else
		   render "edit"
		end
	end

	private

	def post_params
		params.require(:post).permit(:team_id, :title, :body, :post_image)
	end
end
