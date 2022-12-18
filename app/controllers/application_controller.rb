class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end
  
end
