class AddCourseIdToStationCategoryAndStationCategoryIdToStation < ActiveRecord::Migration[5.2]
  def change
    add_column :station_categories, :course_id, :integer
    add_column :stations, :station_category_id, :integer
  end
end
