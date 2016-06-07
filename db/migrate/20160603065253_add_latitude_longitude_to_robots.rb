class AddLatitudeLongitudeToRobots < ActiveRecord::Migration
  def change
    add_column :robots, :latitude, :decimal
    add_column :robots, :longitude, :decimal
  end
end
