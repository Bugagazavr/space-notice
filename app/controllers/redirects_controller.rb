class RedirectsController < ApplicationController
  def show
    proxy_url = ProxyUrl.find_by_code!(params[:code])
    redirect_to proxy_url.url
  end
end
