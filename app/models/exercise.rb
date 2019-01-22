class Exercise < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :category
  
  def self.search(term)
    where('LOWER(name) LIKE :term', term: "%#{term.downcase}%")
  end
end
