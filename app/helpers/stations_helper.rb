module StationsHelper
  def selected(params)
    if !params[:station_category_id].nil?
      return params[:station_category_id]
    else
      return nil
    end
  end

  def check_course_id(params)
    if params[:course_id]
      @course = Course.find_by_id(params[:course_id])
      @station_categories = @course.station_categories.all
      return @course, @station_categories
    elsif @course
      @station_categories = @course.station_categories.all
      return @station_categories
    else
      @station_categories = StationCategory.all
      return @station_categories
    end
  end

end
