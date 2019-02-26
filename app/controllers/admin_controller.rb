class AdminController < ApplicationController
  before_action :admin_user
  
  def admin
      puts("displaying admin page")
     @roles = Role.all
      
      @trainers = []
      @users = User.all
      
      @users.each do |u|
        if u.is_trainer?
          @trainers.push(u)
        end
      end
      
      @trainers = [] if (@trainers.nil?)
  end
  
  def process_add_client
    trainer_id = params[:trainer_id]
    client_id = params[:client_id]
    ClientTrainerRelation.add_client_trainer_relationship(client_id, trainer_id)
    
    render json: { status: 200 }

  end
  
  def process_delete_client
    trainer_id = params[:trainer_id]
    client_id = params[:client_id]
    ClientTrainerRelation.delete_client_trainer_relationship(client_id, trainer_id)
    
    render json: { status: 200 }

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
