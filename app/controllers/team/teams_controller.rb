class Team::TeamsController < ApplicationController
	def index
		@teams = Team.page(params[:page]).per(10)
	end

	def show
		@team = Team.find(params[:id])
	end

	def edit
		@team = Team.find(params[:id])
	end

	def update
		@team = Team.find(params[:id])
		if @team.update(team_params)
		   redirect_to team_team_path(@team), notice: "チーム情報を変更しました。"
		else
		   render "edit"
		end
	end

	def exit # 退会画面
	end

	def destroy
		@team = Team.find(params[:id])
		@team.destroy
		redirect_to root_path, notice: "ご利用、ありがとうございました。"
	end

	private

	def team_params
		params.require(:team).permit(:name, :member, :category, :prefecture_code, :city, :street,
									 :phone_number, :email, :team_image, :introduction)
	end
end
