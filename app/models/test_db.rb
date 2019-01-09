class TestDB < ActiveRecord::Base
    
    attr_accessor :title, :attributes, :description, :start_date, :end_date
    validates_presence_of :title, :attributes, :description, :start_date, :end_date
end
