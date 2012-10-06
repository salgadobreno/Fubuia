# coding: utf-8
class AuthenticationController < ApplicationController

  def create
    @user = User.from_omniauth(env["omniauth.auth"])

    if @user.save && Session.create(@user)

      cookies.permanent[:revisitor] = 1
      if params[:state] == "first_log_in"
        redirect_to start_events_import_path, :flash => {:success => "Muito bem vindo! Abaixo estão seus eventos no Facebook, se para importá-lo p/ o site clique em 'importar'." }
      else
        redirect_to root_url, :flash => {:success => t('messages.login_success') }
      end
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
