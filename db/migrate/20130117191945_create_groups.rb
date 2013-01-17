class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|

    	t.string :name
    	t.string :website
    	t.string :facebook_id
    	t.string :twitter_id
    	t.string :linked_in_id
    	t.string :address
    	t.string :city
    	t.string :state
    	t.string :zip
    	t.string :country
    	t.string :type

      t.timestamps
    end
  end
end
