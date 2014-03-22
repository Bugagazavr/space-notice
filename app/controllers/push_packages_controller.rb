class PushPackagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def show
website_params = {
    "websiteName" => "Space Notice",
    "websitePushID" => "web.com.spacenotice",
    "allowedDomains" => ["https://space-notice.com"],
    "urlFormatString" => "https://space-notice.com",
    "authenticationToken" => "12345678901234567890",
    "webServiceURL" => "https://space-notice.com"
  }

  iconset_path = "#{Rails.root}/config/package/icons"
  certificate = "#{Rails.root}/config/package/cert.p12"
  package = PushPackage.new(website_params, iconset_path, certificate)
  package.save("#{Rails.root}/config/push_package")
    Rails.logger.info params.inspect
    send_file "#{Rails.root}/config/push_package", type: "application/zip"
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
