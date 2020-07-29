class Team::PostsController < ApplicationController
	before_action :authenticate_team!
	# showを含めるとpostのリンクが機能しなくなってしまうので入れない。
	before_action :protect, only:[:edit, :update, :destroy]
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
		@q = Post.ransack(params[:q])
		if params[:team].nil? # 投稿一覧出力時に、チームidが含まれているかどうか。
			@posts = @q.result(distinct: true).page(params[:page]).per(15).order(created_at: "DESC")
		else
			@posts = @q.result(distinct: true).where(team_id: params[:team]).page(params[:page]).per(10).order(created_at: "DESC")
		end
	end

	def show
		@post = Post.find(params[:id])
		# マイページのサイドテーブルのpostリンクが機能しなくなるのでbefore_actionに入れない。
	end

	def edit
	end

	def update
		if @post.update(post_params)
		   redirect_to team_post_path, notice: "投稿を編集しました。"
		else
		   render "edit"
		end
	end

	def destroy
		@post.destroy
		redirect_to team_posts_path, notice: "投稿を削除しました。"
	end

	private

	def protect
		@post = Post.find(params[:id])
		if current_team != @team
	       redirect_to team_team_path(current_team)
	    end
	end

	def post_params
		params.require(:post).permit(:team_id, :title, :body, :post_image)
	end
end
