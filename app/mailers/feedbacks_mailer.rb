class FeedbacksMailer < ApplicationMailer
  def send_message(feedback)
    @feedback = feedback

    mail to: 'fortestsmyapps@gmail.com', from: @feedback.user.email
  end
end
