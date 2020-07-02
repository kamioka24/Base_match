class Player::PlayersController < ApplicationController
	def show
		@player = current_player
		@teams = Team.where(prefecture_code: @player.prefecture_code).page(params[:page]).per(8).order(:city).order(member: "DESC")
		# @teams = Team.page(params[:page]).per(8).order(:prefecture_code).order(:city).order(member: "DESC")
		# 5行目でも出力できたが、4行目の方が確実？ (current_playerと同じ都道府県テームの出力。一応viewにも定義はしてある。)
		@posts = Post.page(params[:page]).per(8).order(:prefecture_code).order(created_at: "DESC")
		# @posts = Post.joins(:team).where(prefecture_code: @player.prefecture_code).page(params[:page]).per(8).order(:prefecture_code).order(created_at: "DESC")
		# @teamsと同じようにできない？
	end

	def edit
		@player = Player.find(params[:id])
	end

	def update
		@player = Player.find(params[:id])
		if @player.update(player_params)
		   redirect_to player_player_path(@player), notice: "登録情報を変更しました。"
		else
		   render "edit"
		end
	end

	def exit # 退会画面
	end

	def destroy
		@player = Player.find(params[:id])
		@player.destroy
		redirect_to root_path, notice: "ご利用、ありがとうございました。"
	end

	private

	def player_params
		params.require(:player).permit(:name, :prefecture_code, :email)
	end
end
