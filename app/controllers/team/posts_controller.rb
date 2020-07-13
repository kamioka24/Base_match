class Team::PostsController < ApplicationController
	before_action :authenticate_team!
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
		@currentTeamEntry=Entry.where(team_id: current_team.id)
		@teamEntry=Entry.where(team_id: @team.id)
		if @team.id != current_team.id
		   @currentTeamEntry.each do |cu|
		       @teamEntry.each do |u|
		       	   if cu.room_id == u.room_id then
		       	   	   @isRoom = true
		       	   	   @roomId = cu.room_id
		       	   end
		       	end
		    end
		    if @isRoom
		    else
		    	@room = Room.new
		        @entry = Entry.new
		    end
		end
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
