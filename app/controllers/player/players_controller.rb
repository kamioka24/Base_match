class Player::PlayersController < ApplicationController
	def show
		@player = Player.find(params[:id])
		@teams = Team.page(params[:page]).per(8)
		@posts = Post.page(params[:page]).per(5)
	end

	def edit
		@player = Player.find(params[:id])
	end

	def update
		@player = Player.find(params[:id])
		if @player.update
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

	def player_paramas
		params.require(:player).permit(:name, :prefecture_code, :email)
	end
end
