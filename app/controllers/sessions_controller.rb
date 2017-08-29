class SessionsController < ApplicationController
  def create
    session[:user_info] = auth_hash
    redirect_to root_path
  end

  def destroy
    session.delete :user_info
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
