class SplashController < ApplicationController
    def splash_screen()
        if !current_effective_user.nil? and current_effective_user.is_admin? then
            redirect_to admin_path
        elsif current_effective_user then 
            redirect_to '/dashboard'
        end
        
    end
    
end