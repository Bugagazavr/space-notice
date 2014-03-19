class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    !!current_user
  end
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    session[:user_id] = nil
  end
  helper_method :current_user

  def current_user=(user)
    if @current_user = user
      session[:user_id] = user.id
    else
      session.delete(:user_id)
    end
  end

  def authenticate_user!
    redirect_to root_path unless logged_in?
  end
end
