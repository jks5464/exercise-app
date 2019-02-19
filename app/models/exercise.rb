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
end
