class RoleAssignment < ActiveRecord::Base
    belongs_to :user
    belongs_to :role
    def self.update_roles(user_role_data)
        user_role_data.each do | i, user_dict |
           user_id = user_dict["user_id"].strip.to_i
           new_role_id = user_dict["role_id"].strip.to_i
           user = User.find(user_id)
           existing_role_id = user.existing_role_assignment.role_id
           
           if new_role_id != existing_role_id then
               user.destroy_role_assignments
               if existing_role_id == 1 then
                   relationships = ClientTrainerRelation.where(trainer_id: user_id)
                    relationships.each do |rel| 
                        rel.destroy
                    end
               end
               create(user_id: user_id, role_id: new_role_id)
           end
        end
    end
end
