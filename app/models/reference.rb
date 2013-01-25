class Reference < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :person
  belongs_to :article
  belongs_to :group


end
