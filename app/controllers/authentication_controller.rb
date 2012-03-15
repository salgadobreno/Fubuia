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
      redirect_to root_url, :notice => "logado com sucesso"
    else
      raise UnexpectedException
    end
  end

  def destroy
    current_user_session.destroy
    session[:fuser] = nil
    redirect_to root_url, :notice => "deslogado com sucesso"
  end

end
