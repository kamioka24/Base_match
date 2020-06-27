class Player::PostsController < ApplicationController
	def index
		@posts = Post.page(params[:page]).per(10).order(created_at: "DESC") #降順
		@q = Post.ransack(params[:q])
		@post = @q.result(distinct: true)
	end

	def show
		@post = Post.find(params[:id])
	end
end
