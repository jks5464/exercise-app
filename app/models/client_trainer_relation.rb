class ClientTrainerRelation < ActiveRecord::Base
    belongs_to :client, class_name: "User"
    belongs_to :trainer, class_name: "User"
    
    def self.add_client_trainer_relationship(client_id, trainer_id)
        relationship = where(client_id: client_id, trainer_id: trainer_id)
        if relationship.nil?
            create(client_id: client_id, trainer_id: trainer_id)
        end
    end
    
    def self.delete_client_trainer_relationship(client_id, trainer_id)
        relationship = where(client_id: client_id, trainer_id: trainer_id)
        relationship.each do |rel|
            rel.destroy
        end
    end      
end
