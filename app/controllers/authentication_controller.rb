class AuthenticationController < ApplicationController
    before_action :authenticate_user
    helper_method :authenticate_user
    
    def authenticate_user
        if !session[:user_id] then
            redirect_to root_path
        end
    end
end
