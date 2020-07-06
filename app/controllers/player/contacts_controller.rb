class Player::ContactsController < ApplicationController
	before_action :authenticate_player!
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		binding.pry
		if @contact.save
		   ContactMailer.contact_mail(@contact).deliver
		   redirect_to complete_player_contacts_path
		else
		   render "new"
		end
	end

	def complete # 送信完了画面
		@team = Team.find(params[id])
	end

	private

	def contact_params
		params.require(:contact).permit(:player_id, :name, :school, :year, :address,
		                                :phone_number, :choice, :day, :question)
	end
end
