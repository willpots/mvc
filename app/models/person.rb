class Person < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :references
  has_many :articles, :through => :references

  has_many :connections
  has_many :groups, :through => :connections



end
