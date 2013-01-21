class AddMiddColumnsToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :middstart, :string
    add_column :groups, :millenium_interns, :string
    add_column :groups, :vcet, :string
    add_column :groups, :operations_in_midd, :string
    add_column :groups, :midd_employees, :string
  end
end
