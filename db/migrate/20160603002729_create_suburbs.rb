class CreateSuburbs < ActiveRecord::Migration
  def change
    create_table :suburbs do |t|
      t.integer :postcode
      t.string :suburb_name
      t.string :state
      t.decimal :latitude
      t.decimal :longitude
      t.timestamps null: false
    end
  end
end
