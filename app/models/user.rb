class User < ActiveRecord::Base
  has_many :workout, :dependent => :destroy
  has_many :goal
  has_many :role_assignments
  has_many :roles, through: :role_assignments
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  
  def clients
    relations = ClientTrainerRelation.where(trainer_id: self.id)
    my_clients = []
    relations.each do | rel |
      new_client = User.find(rel.client_id)
      if !new_client.nil? then
        my_clients.push(new_client)
      end 
    end
    return my_clients
  end
  
  def trainers
    relations = ClientTrainerRelation.where(client_id: self.id)
    my_trainers = []
    relations.each do | rel |
      new_trainer = User.find(rel.trainer_id)
      if !new_trainer.nil? then
        my_trainers.push(new_trainer)
      end
    end
    return my_trainers
  end
  
  def is_trainer?
    roles = self.roles
    roles.each do | role |
      if role.name == "Trainer" then
        return true
      end
    end
    return false
  end
  
  def is_admin?
    roles = self.roles
    roles.each do | role |
      if role.name == "Admin" then
        return true
      end
    end
    
    return ((self.id == 1) or (Rails.env.development? and self.id == 6))
  end
  
  def can_delete_exercise?(exercise)
    active_exercise_users = exercise.get_active_users
    return (
           (self.is_admin?) or 
           (active_exercise_users.size == 0) or 
           (active_exercise_users.size == 1 and active_exercise_users.include?(self))
           )
  end
  
end
