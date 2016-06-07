class AddFirstNameToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :user_firstname, :string
  end
end
