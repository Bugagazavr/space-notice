class NotificationTypesController < ApplicationController
  before_action :authenticate_user!

  def create
    @project = current_user.projects.find(params[:project_id])
    @type = @project.notification_types.build(notification_type_params)
    if @type.save
      redirect_to root_path
    else
      render "dashboard/show"
    end
  end

  def destroy
    @project = current_user.projects.find(params[:project_id])
    @project.notification_types.where(id: params[:id]).destroy_all
    redirect_to root_path
  end

  private
  def notification_type_params
    params.require(:notification_type).permit(:name)
  end
end
