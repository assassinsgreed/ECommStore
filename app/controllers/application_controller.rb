class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #Admin control
  protected
  def require_sudo
    require 'digest'
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && Digest::SHA1.hexdigest(password) == '6358b5cb2992b884678743e7ab0fdbb6e718a96f'
    end
  end
end
