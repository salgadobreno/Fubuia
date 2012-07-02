class AuthenticationController < ApplicationController

  def create
    raise MissingTokenException if params[:code].blank?

    @graph = Koala::Facebook::API.new(params[:code])
    @facebook_user = HashWithIndifferentAccess.new @graph.get_object("me")

    @user = User.find_or_initialize_by_facebook_uid(@facebook_user[:id])
    @user.active = true if @user.new_record?
    @user.attributes = {
      :access_token => params[:code],
      :email => @facebook_user[:email],
      :location_id => (@facebook_user[:location][:id] rescue nil)
    }
    if @user.save && Session.create(@user)
      session[:fuser] = @facebook_user
      redirect_to root_url, :flash => {:success => t('messages.login_success') }
    else
      raise UnexpectedException
    end
  end

  def destroy
    current_user_session.destroy unless current_user_session.blank?
    session[:fuser] = nil
    redirect_to root_url, :flash => {:notice => t('messages.logout_success') }
  end

end
