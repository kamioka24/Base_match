class Team::MessagesController < ApplicationController
	before_action :authenticate_team!, :only => [:create]
	def create
		if Entry.where(:team_id => current_team.id, :room_id => params[:message][:room_id]).present?
		   @message = Message.create(params.require(:message).permit(:team_id, :content, :room_id).merge(:team_id => current_team.id))
		   redirect_back(fallback_location: root_path)
		end
	end
end