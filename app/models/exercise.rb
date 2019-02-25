class Exercise < ActiveRecord::Base
  belongs_to :user
  has_many :task, :dependent => :destroy
  has_many :goal, :dependent => :destroy
  validates_presence_of :name, :category
  
  def self.search(term)
    where('LOWER(name) LIKE :term', term: "%#{term.downcase}%")
  end
  
  def self.get_by_name(name)
    where(name: name).first
  end
  
  def self.delete_exercise(exercise_id)
    exercise = find(exercise_id)
    exercise.destroy
  end
  
  def get_active_users
    active_users = Set.new
    self.task.each do | task |
      active_users.add(task.workout.user)
    end
    
    self.goal.each do | goal |
      active_users.add(goal.user)
    end
    
    return active_users
  end
end
