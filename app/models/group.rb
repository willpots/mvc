class Group < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :connections
  has_many :persons, :through => :connections

end
