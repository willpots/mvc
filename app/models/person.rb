class Person < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :connections
  has_many :articles
  has_many :groups, :through => :connections

end