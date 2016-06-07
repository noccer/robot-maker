class CreateRobots < ActiveRecord::Migration
  def change
    create_table :robots do |t|
      t.string :robot_name
      t.string :suburb
      t.integer :postcode
      t.string :state
      t.string :img_sm
      t.string :img_lg
      t.references :user
      t.timestamps null: false
    end
  end
end
