class AddPhotoColumnToGroups < ActiveRecord::Migration
  def change
  	add_column :groups, :picture, :string
  end
end
