class ProxyUrl < ActiveRecord::Base
  def self.short(url)
    proxy_url = where(url: url).first_or_create! do |proxy_url|
      proxy_url.url = url
      proxy_url.code = SecureRandom.uuid
    end
    proxy_url.short_url
  end

  def short_url
    "https://space-notice.com/go/#{code}"
  end
end
