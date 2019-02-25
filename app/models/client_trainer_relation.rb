class ClientTrainerRelation < ActiveRecord::Base
    belongs_to :client, class_name: "User"
    belongs_to :trainer, class_name: "User"
                    
    def self.delete_client(client_id)
        client = find(client_id)
        client.destroy
    end      
end
