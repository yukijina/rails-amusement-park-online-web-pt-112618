class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :admin_login

  def current_user
    User.find_by(id: session[:user_id])
  end

  def admin_login
    current_user.admin == true
  end


end
