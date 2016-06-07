class AddQuotesToRobots < ActiveRecord::Migration
  def change
    add_column :robots, :quote, :string
  end
end
