class FeedbacksMailer < ApplicationMailer
  def send_message(feedback)
    @feedback = feedback

    mail to: 'olyailfatovna@yandex.ru', from: @feedback.user.email
  end
end
