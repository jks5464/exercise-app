class Exercise < ActiveRecord::Base
    
    enum category: [:cardio, :strength, :other]
    
    validates_presence_of :name, :description, :muscle_group, :category
    
end
