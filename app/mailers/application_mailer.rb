class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <pashk0vaolya@yandex.ru>}
  layout "mailer"
end
