class Exercise < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :category
  
  def self.search(term)
    where('LOWER(name) LIKE :term', term: "%#{term.downcase}%")
  end
  
  def self.get_by_name(name)
    where(name: name).first
  end
end
