class AdminController < ApplicationController
  def admin
      puts("displaying admin page")
      
      @trainers = []
      @users = User.all
      
      @users.each do |u|
        if u.is_trainer?
          @trainers.push(u)
        end
      end
      
      @trainers = [] if (@trainers.nil?)
  end

end
