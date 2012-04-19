ActionMailer::Base.smtp_settings = { 
  :address              => "smtp.gmail.com", 
  :port                 => 587, 
  :domain               => "yourdomain.com", 
  :user_name            => "ricsrock@gmail.com", 
  :password             => "9lmwvm12113", 
  :authentication       => "plain", 
  :enable_starttls_auto => true
}