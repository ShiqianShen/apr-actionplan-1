ActionMailer::Base.smtp_settings = {
    :address   => ENV['SMTP_ADDRESS'],
    :port      => ENV['SMTP_PORT'],
    :enable_starttls_auto => true,
    :user_name => ENV['SMTP_USERNAME'],
    :password  => ENV['SMTP_PASSWORD'],
    :authentication => ENV['SMTP_AUTH'],
    :domain    => ENV['SMTP_DOMAIN']
}
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default :charset => ENV['SMTP_CHARSET']