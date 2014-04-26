class NotificationsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    @project = Project.find_by_token!(params[:token])
    @project.push params[:title], params[:message], params[:url]
    head :ok
  end
end
