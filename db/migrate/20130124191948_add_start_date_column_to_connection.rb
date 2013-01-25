class AddStartDateColumnToConnection < ActiveRecord::Migration
  def change
  	add_column :connections, :start_date, :string
  	add_column :connections, :end_date, :string
  end
end
