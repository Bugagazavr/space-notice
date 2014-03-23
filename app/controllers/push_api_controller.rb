class PushApiController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def package
    send_data Package.create(package_params), type: "application/zip"
  end

  def log
    Rails.logger.info params.inspect
    render nothing: true
  end

  def subscribe
    Rails.logger.info request.headers["HTTP_AUTHORIZATION"].inspect
    Rails.logger.info params.inspect
    render nothing: true
  end

  def unsubscribe
   subscribe
  end
end
