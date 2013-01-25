class Article < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :person
  
  has_many :persons, :through => :reference
  has_many :groups, :through => :reference
  
end
