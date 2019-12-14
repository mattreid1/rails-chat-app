class ApplicationMailer < ActionMailer::Base
  default to: 'mr00846@surrey.ac.uk', from: 'website@com2025.mattreid.dev'
  layout 'mailer'
end
