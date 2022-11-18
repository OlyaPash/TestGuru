class FeedbacksMailer < ApplicationMailer
  def send_message(feedback)
    @feedback = feedback

    mail to: 'olya.pash.rb@gmail.com', from: @feedback.user.email
  end
end
