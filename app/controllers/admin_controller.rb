class AdminController < ApplicationController
  before_action :admin_user
  
  def admin
      puts("displaying admin page")
     @roles = Role.all
  end
  
  def admin_user
    if !(current_user.name == "GirlScout Cookie")
      redirect_to '/dashboard'
    end
  end
  
  def process_admin
    user_role_data = params[:user_role_data]
    RoleAssignment.update_roles(user_role_data)
    render json: { status:200}
  end
  

end
