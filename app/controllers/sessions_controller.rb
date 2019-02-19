class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    if(user.name.to_s == 'GirlScout Cookie') then
      redirect_to admin_path
    else
      redirect_to dashboard_path
    end
    
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
