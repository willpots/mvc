class AddRoleColumnToConnection < ActiveRecord::Migration
  def change
  	add_column :connections, :role, :string
  end
end
