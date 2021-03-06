class Player::ContactsController < ApplicationController
  before_action :authenticate_player!
  def new
    @contact = Contact.new
    @team = Team.find(params[:team_id])
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.player_id = current_player.id
    @team = Team.find(params[:team_id])
    if @contact.save
       ContactMailer.contact_mail(@contact).deliver
       redirect_to complete_player_team_contacts_path(team_id: @team.id)
    else
       render "new"
    end
  end

  def complete # 送信完了画面
    @team = Team.find(params[:team_id])
    # オススメチームの表示↓↓
    @i = current_player.contacts
    @all = Team.all
    @i.each do |team|
      @all = @all.where.not(id: team.team_id)
    end
    @picup_team = @all.order("RAND()").limit(3)
  end

  private

  def contact_params
    params.require(:contact).permit(:player_id, :team_id, :name, :school, :year, :address,
                                    :phone_number, :choice, :day, :question)
  end
end