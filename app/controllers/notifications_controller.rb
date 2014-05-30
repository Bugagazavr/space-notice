class NotificationsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    @project = Project.find_by_token!(params[:token])
    @project.push params[:title], params[:message], params[:url]
    head :ok
  end

  def travis
    @project = Project.find_by_token!(params[:token])
    @project.push_payload(params[:payload])
    head :ok
  end

  def cloud66_deploy_success
    @project = Project.find_by_token!(params[:token])
    @project.push_cloud66_success_payload(params)
    head :ok
  end

  def cloud66_deploy_failed
    @project = Project.find_by_token!(params[:token])
    @project.push_cloud66_deploy_failed(params)
    head :ok
  end
end
