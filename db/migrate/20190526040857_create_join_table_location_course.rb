class CreateJoinTableLocationCourse < ActiveRecord::Migration[5.0]
  def change
    create_join_table :locations, :courses do |t|
      t.index [:location_id, :course_id]
      # t.index [:course_id, :location_id]
    end
  end
end
