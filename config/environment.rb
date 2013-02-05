# Load the rails application
require File.expand_path('../application', __FILE__)




ActionMailer::Base.smtp_settings = {
  :user_name => "middventures",
  :password => "MiddleburyVentures13",
  :domain => "heroku.com",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.raise_delivery_errors = true


# Initialize the rails application
Mvc::Application.initialize!

