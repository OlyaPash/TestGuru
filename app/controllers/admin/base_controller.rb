class Admin::BaseController < ApplicationController

  layout 'admin'
  
  before_action :authenticate_user!
  before_action :admin_requaired!

  private

  def admin_requaired!
    redirect_to tests_path, alert: 'You are not authorized to view this page.' unless current_user.is_a?(Admin)
  end

end
