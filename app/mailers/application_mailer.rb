class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <fortestsmyapps@gmail.com>}
  layout "mailer"
end
