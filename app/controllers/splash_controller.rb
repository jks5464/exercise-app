class SplashController < ApplicationController
    def splash_screen()
        if current_user == "GirlScout Cookie" then
            redirect_to admin_path
            
        elsif current_user then 
            redirect_to '/dashboard'
            
        end
        

        
    end
    
end