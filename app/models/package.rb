class Package
  attr_reader :path

  def initialize(params)
    @website_params = default_website_params.merge(params)
    @iconset_path = "#{Rails.root}/config/package/icons"
    @certificate = "#{Rails.root}/config/package/cert.p12"
    @path = "/tmp/#{SecureRandom.hex(16)}"
  end

  def self.create(params)
    package = new(params)
    package.save
    package.path
  end

  def save
    package = PushPackage.new(@website_params, @iconset_path, @certificate)
    package.save(@path)
  end

  private
  def default_website_params
    { "websiteName"         => "Space Notice",
      "websitePushID"       => "web.com.spacenotice",
      "allowedDomains"      => ["https://space-notice.com"],
      "urlFormatString"     => "https://space-notice.com/go/%@",
      "authenticationToken" => "",
      "webServiceURL"       => "https://space-notice.com" }
  end
end
