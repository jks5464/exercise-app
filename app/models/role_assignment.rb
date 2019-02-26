class RoleAssignment < ActiveRecord::Base
    belongs_to :user
    belongs_to :role
    def self.update_roles(user_role_data)
        user_role_data.each do | user_dict |
           user = find(user_dict.user_id)
           existing_role = user.role_id
           new_role = user_dict.role_id
           if new_role != existing_role then
                if existing_role == 2 && new_role == 3 then #admin --> client
                    user.destroy
                elsif existing_role == 2 && new_role == 1 then  #admin --> trainer
                    user.destroy
                    create(user_id: user_dict.user_id, role_id: new_role)
                elsif existing_role == 1 && new_role == 3 then  #trainer --> client
                    relationships = ClientTrainerRelation.where(trainer_id: user_dict.user_id)
                    relationships.each do |rel| 
                        rel.destroy
                    end
                    user.destroy
                   
                elsif existing_role == 1 && new_role == 2 then  #trainer --> admin
                    relationships = ClientTrainerRelation.where(trainer_id: user_dict.user_id)
                    relationships.each do |rel| 
                        rel.destroy
                    end
                    user.destroy
                    create(user_id: user_dict.user_id, role_id: new_role)
                else #(new_role == 1 || new_role == 2) #client --> trainer or admin
                    create(user_id: user_id, role_id: new_role)
                end
               
           end
        end
    end
end
