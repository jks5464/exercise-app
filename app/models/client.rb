class Client < ActiveRecord::Base
    attr_accessor :measurements
    def initialize
        @measurements = Array.new
    end
    
    def process_enter_new_measurements(weight, body_fat, height)
        @measurements.push([weight, body_fat, height])
    end
    
    def add
        @db.weight = @measurements[0]
        @db.body_fat = @measurements[1]
        @db.height = @measurements[2]
        @db.save!
    end
 

end
