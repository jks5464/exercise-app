class TestDBDB < ActiveRecord::Base
    
    validates_presence_of :title, :attributes, :description, :start_date, :end_date
end
