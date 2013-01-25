class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|

      t.references :person
      t.references :group
      t.references :article

      t.timestamps
    end
  end
end
