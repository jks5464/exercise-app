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
    
    def State.valid_state?(state)
        return ((state == @@saved) or (state == @@planned) or (state ==  @@complete))
    end
end
