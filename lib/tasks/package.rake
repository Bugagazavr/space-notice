task :create_push_package do
  require 'push_package'

  website_params = {
    websiteName: "Space Notice",
    websitePushID: "web.com.spacenotice",
    allowedDomains: ["https://space-notice.com"],
    urlFormatString: "https://space-notice.com/",
    authenticationToken: "19f8d7a6e9fb8a7f6d9330dabe",
    webServiceURL: "https://space-notice.com/push"
  }

  iconset_path = "#{Rails.root}/config/package/icons"
  certificate = "#{Rails.root}/config/package/cert.p12"
  package = PushPackage.new(website_params, iconset_path, certificate)
  package.save("#{Rails.root}/config/push_package")
end
