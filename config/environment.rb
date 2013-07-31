# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Depot::Application.initialize!

#WillPaginate::ViewHelpers.pagination_options[:previous_label] = "上"
#WillPaginate::ViewHelpers.pagination_options[:next_label] = "下"
Depot::Application.configure do
     config.action_mailer.smtp_settings = {
     address:                "smtp.gmail.com",
     port:                   587,
     domain:                 "domain.of.sender.net",
     authentication:         "plain",
     user_name:              "imwubinqi@gmail.com",
     password:               "bdjaqsjarwhwnsye",
     enable_starttls_auto:   true
   }
  
end