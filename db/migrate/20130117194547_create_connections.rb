class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|

      t.references :person
      t.references :group


      t.timestamps
    end
  end
end
