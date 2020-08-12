class Team::TeamsController < ApplicationController
	before_action :authenticate_team!
	before_action :protect, only:[:edit, :update, :destroy]
	def index
		@q = Team.ransack(params[:q])
		@teams = @q.result(distinct: true).page(params[:page]).per(15).order(:prefecture_code).order(:city).order(member: "DESC")
	end

	def show
		@team = Team.find(params[:id])
		@posts = @team.posts.page(params[:page]).per(10).order(created_at: "DESC")
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
	end

	def update
		if @team.update(team_params)
		   redirect_to team_team_path(@team), notice: "チーム情報を変更しました。"
		else
		   render "edit"
		end
	end

	def exit # 退会画面
	end

	def destroy
		@team.destroy
		redirect_to root_path, notice: "ご利用、ありがとうございました。"
	end

	private

	def protect
		@team = Team.find(params[:id])
		if current_team != @team
	     redirect_to team_team_path(current_team)
	  end
	end

	def team_params
		params.require(:team).permit(:name, :member, :category, :prefecture_code, :city, :street,
									 :phone_number, :email, :team_image, :introduction)
	end
end