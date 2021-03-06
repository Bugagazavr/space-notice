class PushApiController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def package
    send_file Package.create(package_params), type: "application/zip"
  end

  def log
    render nothing: true
  end

  def subscribe
    @user = User.find_by_token!(token)
    @user.add_device(params[:token])
    head :ok
  end

  def unsubscribe
    @user = User.find_by_token!(token)
    @user.remove_device(params[:token])
    head :ok
  end

  private
  def package_params
    params.require(:push_api).permit(:authenticationToken)
  end

  def token
    request.headers["HTTP_AUTHORIZATION"][/ApplePushNotifications (.*)$/, 1]
  end
end
