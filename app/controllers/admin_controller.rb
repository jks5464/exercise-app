class AdminController < ApplicationController
  def admin
      puts("displaying admin page")
      @trainers = User.all
  end

end
