class Player::PlayersController < ApplicationController
	def show
		@player = Player.find(params[:id])
	end

	def edit
	end

	def update
	end

	def exit
	end

	def destroy
	end

	private

	def player_paramas
	end
end
