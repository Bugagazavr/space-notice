class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to root_path
    else
      render "home/dashboard"
    end
  end

  def destroy
    current_user.projects.where(id: params[:id]).destroy_all
    redirect_to root_path
  end

  private
  def project_params
    params.require(:project).permit(:name)
  end
end
