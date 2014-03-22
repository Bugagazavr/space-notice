class PushPackagesController < ApplicationController
  def show
    send_file "#{Rails.root}/config/push_package", type: "application/zip"
  end
end
