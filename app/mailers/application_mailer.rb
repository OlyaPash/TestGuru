class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <olya.pash.rb@gmail.com>}
  layout "mailer"
end
