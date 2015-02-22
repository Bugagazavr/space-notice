Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_CLIENT'], ENV['GITHUB_SECRET']
  provider :gitlab, ENV['GITLAB_CLIENT'], ENV['GITLAB_SECRET']
end

if Rails.env.production?
  OmniAuth.config.full_host = ENV['NOTICE_URL'] || "https://space-notice.com"
end
