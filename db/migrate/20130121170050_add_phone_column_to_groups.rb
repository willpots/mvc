class AddPhoneColumnToGroups < ActiveRecord::Migration
  def up
    add_column :groups, :phone, :string
    add_column :groups, :founded, :string
    add_column :groups, :video, :string
    add_column :people, :title, :string
  end

  def down
    remove_column :groups, :phone
    remove_column :groups, :founded
    remove_column :groups, :video
    remove_column :people, :title
  end
end
