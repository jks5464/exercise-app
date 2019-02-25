class ClientTrainerRelation < ActiveRecord::Base
    belongs_to :client, class_name: "User"
    belongs_to :trainer, class_name: "User"
                    
    def self.delete_client_trainer_relationship(client_id: client_id, trainer_id: trainer_id)
        relationship.destroy
    end      
end
