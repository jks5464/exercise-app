class ClientTrainerRelation < ActiveRecord::Base
    belongs_to :client, class_name: "User"
    belongs_to :trainer, class_name: "User"
    
    def self.add_client_trainer_relationship(client_id, trainer_id)
        client_id = client_id.to_i
        trainer_id = trainer_id.to_i
        relationship = where(client_id: client_id, trainer_id: trainer_id)
        if client_id != trainer_id and relationship.empty?
            create(client_id: client_id, trainer_id: trainer_id)
        end
    end
    
    def self.delete_client_trainer_relationship(client_id, trainer_id)
        client_id = client_id.to_i
        trainer_id = trainer_id.to_i
        relationship = where(client_id: client_id, trainer_id: trainer_id)
        relationship.each do |rel|
            rel.destroy
        end
    end      
end
