class AddCourseIdToStations < ActiveRecord::Migration[5.2]
  def change
    add_column :stations, :course_id, :integer
  end
end
