class ApplicationMailer < ActionMailer::Base
  default from: '@player.email'
          to: @team.email
  layout 'mailer'
end
