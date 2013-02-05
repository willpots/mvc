class AddPasswordTokenToPerson < ActiveRecord::Migration
  def change
    add_column :people, :password_token, :string
  end
end
