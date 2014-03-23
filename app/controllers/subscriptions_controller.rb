class SubscriptionsController < ApplicationController
  def new
    @project = Project.find_by_token!(params[:token])
    render layout: "subscription"
  end
end
