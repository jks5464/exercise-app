class ClientTrainerRelation < ActiveRecord::Base
    belongs_to :client, class_name: "User"
    belongs_to :trainer, class_name: "User"
                          
end
