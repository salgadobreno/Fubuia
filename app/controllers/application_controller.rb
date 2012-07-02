# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_app_data
  helper_method :current_user_session, :current_user
  layout "reviewer"


  class NotLoggedIn < Exception; end
  class MissingTokenException < Exception; end
  class UnexpectedException < Exception; end

  rescue_from MissingTokenException do |e|
    redirect_to root_url, :flash => {:error => "Missing AccessToken"}
  end

  rescue_from NotLoggedIn do |e|
    redirect_to root_url, :flash => {:error => t('errors.messages.not_logged_in')}
  end

  protected

  def set_app_data
    @app_data = Facebook::CONFIG.merge("callback_url" => "#{request.scheme}://#{request.host}/")
    if request.subdomain.present? && request.subdomain != 'www'
      @city = City.find_by_subdomain(request.subdomain)
    else
      @city = City.find_by_subdomain('brasilia')
    end
  end

  def app_access_token
    "115184478532515|hHi14dQEY9-VLL_Tw4v9SczDbkg"
  end

  private

  def require_login!
    raise NotLoggedIn if session[:fuser].nil?
  end

  def current_user_session
    return @current_user_session if defined? @current_user_session
    @current_user_session = Session.find
  end

  def current_user
    return @current_user if defined? @current_user
    @current_user = current_user_session && current_user_session.user
  end

end
