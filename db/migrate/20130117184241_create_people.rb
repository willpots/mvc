class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|

      t.string :first_name
      t.string :last_name
      t.boolean :author
      t.string :class_year
      t.string :role
      t.string :email
      t.string :linked_in
      t.string :linked_in_token
      t.string :facebook
      t.string :twitter
      t.string :picture
      t.text :description

      t.timestamps
    end
  end
end
