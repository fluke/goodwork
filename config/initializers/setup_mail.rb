ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "sizrmailer@gmail.com",
  :password             => "k1r20i11",
  :authentication       => "plain",
  :enable_starttls_auto => true
}