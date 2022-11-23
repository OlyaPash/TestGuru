class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = current_user.feedbacks.new(resource_params)

    if @feedback.save
      FeedbacksMailer.send_message(@feedback).deliver_now
      redirect_to tests_path, notice: 'Form sent'
    else
      render :new, alert: 'Need something to write'
    end
  end

  private

  def resource_params
    params.require(:feedback).permit(:message)
  end

end
