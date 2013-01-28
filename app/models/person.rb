class Person < ActiveRecord::Base
  # attr_accessible :title, :body

  validates :first_name, :last_name, :email, :presence => true
  validates :email, :uniqueness => true


  has_many :references
  has_many :articles

  has_many :connections
  has_many :groups, :through => :connections



end
