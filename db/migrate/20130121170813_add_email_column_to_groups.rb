class AddEmailColumnToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :email, :string
  end
end
