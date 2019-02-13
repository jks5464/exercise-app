class State < ActiveRecord::Base
    @@saved = "saved"
    @@planned = "planned"
    @@complete = "complete"
    
    def State.saved
        @@saved
    end
    
    def State.planned
        @@planned
    end
    
    def State.complete
        @@complete
    end
end
