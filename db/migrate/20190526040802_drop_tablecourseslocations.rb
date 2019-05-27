class DropTablecourseslocations < ActiveRecord::Migration[5.0]
  def change
    drop_table :courses_locations
  end
end
