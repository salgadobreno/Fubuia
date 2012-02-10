# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_app_data
  helper_method :current_user_session, :current_user


  class MissingTokenException < Exception; end
  class UnexpectedException < Exception; end
  Struct.new("Region", :name)
    #TODO: placeholder, change after implementing Region

  rescue_from MissingTokenException do |e|
    redirect_to root_url, :flash => {:error => "Missing AccessToken"}
  end

  protected

  def set_app_data
    @app_data = Facebook::CONFIG.merge("callback_url" => "#{request.scheme}://#{request.host}/")
    @region = Struct::Region.new("Brasília")
    #TODO: placeholder
  end

  def app_access_token
    "115184478532515|hHi14dQEY9-VLL_Tw4v9SczDbkg"
  end

  private

  def current_user_session
    return @current_user_session if defined? @current_user_session
    @current_user_session = Session.find
  end

  def current_user
    return @current_user if defined? @current_user
    @current_user = current_user_session && current_user_session.user
  end

end
