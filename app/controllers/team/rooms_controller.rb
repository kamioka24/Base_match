class Team::RoomsController < ApplicationController
  before_action :authenticate_team!
  def show
    @room = Room.find(params[:id])
    if Entry.where(:team_id => current_team.id, :room_id => @room.id).present?
       @messages = @room.messages
       @message = Message.new
       @entries = @room.entries
    else
       redirect_back(fallback_location: root_path)
    end
    @room.messages.where(unread: true).each do |message|
      message.update(unread: false)
    end
  end

  def create
    @room = Room.create
    @entry1 = Entry.create(:room_id => @room.id, :team_id => current_team.id)
    @entry2 = Entry.create(params.require(:entry).permit(:team_id, :room_id).merge(:room_id => @room.id))
    redirect_to team_room_path(@room)
  end
end
