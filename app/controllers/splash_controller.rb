class SplashController < ApplicationController

    def splash_screen()
        if current_user then
            redirect_to '/dashboard'
        end
    end
    
end