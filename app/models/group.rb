class Group < ActiveRecord::Base
  # attr_accessible :title, :body

  validates :name, :description, :presence => true

  has_many :connections
  has_many :persons, :through => :connections

end
