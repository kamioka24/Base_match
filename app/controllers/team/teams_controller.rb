class Team::TeamsController < ApplicationController
	def index
	end

	def show
		@team = Team.find(params[:id])
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

	def team_params
	end
end
