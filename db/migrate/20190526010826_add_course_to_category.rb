class AddCourseToCategory < ActiveRecord::Migration[5.0]
  def change
    create_join_table :categories, :courses do |t|
      t.index [:category_id, :course_id]
    end
  end
end
