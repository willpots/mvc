class Article < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :person

  has_many :persons, :through => :references
  has_many :groups, :through => :references
  has_many :references


  before_destroy { |article| Reference.destroy_all "article_id = #{article.id}" }

end
