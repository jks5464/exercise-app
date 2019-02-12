class Role < ActiveRecord::Base
    has_many :users, through: :role_assignments 
end
