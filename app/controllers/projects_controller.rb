class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.generate_project!
    redirect_to root_path
  end

  def update
    project = current_user.projects.find(params[:id])
    project.update(project_params)
    head :ok
  end

  def destroy
    current_user.projects.where(id: params[:id]).destroy_all
    head :ok
  end

  def subscribe
    @project = Project.find(params[:token])
    current_user.subscribe(@project)
    render layout: "subscription"
  end

  def unsubscribe
    @project = Project.find(params[:token])
    current_user.unsubscribe(@project)
    render layout: "subscription"
  end

  private
  def project_params
    params.require(:project).permit(:name)
  end
end
