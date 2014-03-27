class SessionsController < ApplicationController
  def create
    self.current_user = User.get_by_omniauth(request.env["omniauth.auth"])
    if token = request.env["omniauth.params"].delete("token")
      redirect_to subscription_path(token: token)
    else
      redirect_to root_path
    end
  end

  def destroy
    self.current_user = nil
    redirect_to root_path
  end
end
