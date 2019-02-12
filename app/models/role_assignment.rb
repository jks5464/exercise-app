class RoleAssignment < ActiveRecord::Base
    belongs_to :user
    has_many :role
end
