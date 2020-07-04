# メール設定
# if Rails.env.production?
#   ActionMailer::Base.default_url_options = { host: 'localhost', port: 3000 }
#   ActionMailer::Base.raise_delivery_errors = true
#   ActionMailer::Base.delivery_method = :smtp
#   ActionMailer::Base.smtp_settings = {
#     port:                 ENV["DEV_SMTP_PORT"],
#     address:              ENV["DEV_SMTP_ADDRESS"],
#     domain:               'gmail.com',
#     user_name:            ENV["DEV_SMTP_USER_NAME"],
#     password:             ENV["DEV_SMTP_PASSWORD"],
#     authentication:       'plain',
#     enable_starttls_auto: true
#   }
# elsif Rails.env.development?
#   # ActionMailer::Base.default_url_options = { host: 'localhost', port: 3000 }
#   # ActionMailer::Base.delivery_method = :letter_opener
#   ActionMailer::Base.default_url_options = { host: 'localhost', port: 3000 }
#   ActionMailer::Base.raise_delivery_errors = true
#   ActionMailer::Base.delivery_method = :smtp
#   ActionMailer::Base.smtp_settings = {
#     port:                 ENV["DEV_SMTP_PORT"],
#     address:              ENV["DEV_SMTP_ADDRESS"],
#     domain:               'gmail.com',
#     user_name:            ENV["DEV_SMTP_USER_NAME"],
#     password:             ENV["DEV_SMTP_PASSWORD"],
#     authentication:       'plain',
#     enable_starttls_auto: true
#   }
# else
#   ActionMailer::Base.delivery_method = :test
# end

if Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    port:                 ENV["DEV_SMTP_PORT"],
    address:              ENV["DEV_SMTP_ADDRESS"],
    domain:               'gmail.com',
    user_name:            ENV["DEV_SMTP_USER_NAME"],
    password:             ENV["DEV_SMTP_PASSWORD"],
    authentication:       'plain',
    enable_starttls_auto: true
  }
elsif Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    port:                 ENV["DEV_SMTP_PORT"],
    address:              ENV["DEV_SMTP_ADDRESS"],
    domain:               'gmail.com',
    user_name:            ENV["DEV_SMTP_USER_NAME"],
    password:             ENV["DEV_SMTP_PASSWORD"],
    authentication:       'plain',
    enable_starttls_auto: true
  }
else
  ActionMailer::Base.delivery_method = :test
end