class SessionsController < Devise::SessionsController
  before_action :authenticate_user!
  
  def create
    super
    flash[:notise] = "#{t(:hello_flash)}, #{@user.name}"
  end
end
