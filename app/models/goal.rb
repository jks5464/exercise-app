class Goal < ActiveRecord::Base
    belongs_to :user
    belongs_to :exercise
    belongs_to :unit
    
    def self.day_by_value(user)
        values = []
        user.goal.each do |g|
            
            values.push([g.created_at.strftime("%B %Y %D"),g.value.to_f])
        end
        return values
    end
end
