class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :basic_auth

  private

  # def production?
  # 	Rails.env.production?
  # end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'c37' && password == 'kyon'
    end
  end
end
