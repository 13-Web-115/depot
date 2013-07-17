<<<<<<< HEAD
# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
=======
# Load the Rails application.
require File.expand_path('../application', __FILE__)

Depot::Application.configure do
  config.action_mailer.delivery_method = :smtp
  
  config.action_mailer.smtp_settings = {
    address:              "smtp.gmail.com",
    port:                 587,
    domain:               "domain.of.sender.net",
    authentication:       "plain",
    user_name:            "13web115@gmail.com",
    password:             "aptanastudio",
    enable_starttls_auto: true
  }
end

# Initialize the Rails application.
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
Depot::Application.initialize!
