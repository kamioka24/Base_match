class ContactMailer < ApplicationMailer
	default from: ENV["DEV_SMTP_USER_NAME"]

	def contact_mail(contact)
	    @contact = contact
	    @team = contact.team
	    mail to: @team.email, subject: "選手からのお問い合わせが届きました。"
	end

	# # Subject can be set in your I18n file at config/locales/en.yml
	# # with the following lookup:
	# #
	# #   en.contact_mailer.contact_mail.subject
	# #
	# def contact_mail
	# 	@greeting = "Hi"

	# 	mail to: "to@example.org"
	# end
end
