class Task < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :workout
  has_many :exercise_set, :dependent => :destroy
end
