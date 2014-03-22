class PushPackagesController < ApplicationController
  def show
    send_file "#{Rails.root}/config/push_package"
  end
end
