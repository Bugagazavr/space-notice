require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class GitLab < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => ENV['GITLAB_URL'] || 'https://gitlab.com',
        :authorize_url => "#{ENV['GITLAB_URL'] || 'https://gitlab.com'}/oauth/authorize",
        :token_url => "#{ENV['GITLAB_URL'] || 'https://gitlab.com'}/oauth/token"
      }

      def request_phase
        super
      end

      uid { raw_info['id'].to_s }

      info do
        {
          'nickname' => raw_info['username'],
          'email' => raw_info['email'],
          'name' => raw_info['name'],
          'image' => raw_info['avatar_url'],
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v3/user').parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'gitlab', 'GitLab'