class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin
    redirect_to root_path if authenticate
  end

  def logout
    session[:admin] = false
    redirect_back(fallback_location: root_path)
  end

protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      admin_username = Rails.application.secrets.admin_username
      admin_password = Rails.application.secrets.admin_password
      session[:admin] = true if (username == admin_username && password == admin_password)
    end
  end
end
