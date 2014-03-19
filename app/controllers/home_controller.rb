class HomeController < ApplicationController
  def show
    if logged_in?
      render :dashboard
    else
      render :landing
    end
  end
end
