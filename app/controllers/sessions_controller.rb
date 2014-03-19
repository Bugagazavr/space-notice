class SessionsController < ApplicationController
  def create
    self.current_user = User.get_by_omniauth(request.env["omniauth.auth"])
    redirect_to root_path
  end

  def destroy
    self.current_user = nil
    redirect_to root_path
  end
end
