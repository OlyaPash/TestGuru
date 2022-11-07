class FeedbacksMailer < ApplicationMailer
  def send_message(feedback)
    @feedback = feedback

    mail to: 'pashk0vaolya@yandex.ru', from: @feedback.user.email
  end
end
